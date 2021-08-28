import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:untitled/global.dart';
import 'package:untitled/models/message_model.dart';

class ChatClient {
  Socket? _socket;
  Function(MessageModel)? onMessage;

  var _listener;

  Future<Socket> initSocket() async {
    if (Global().server.ip == null || Global().server.port == null)
      throw ('IP or PORT are null');

    // Connect to the socket
    try {
      this._socket = await Socket.connect(
          Global().DEBUG ? '10.0.2.2' : Global().server.ip,
          Global().DEBUG ? 5555 : Global().server.port!,
          timeout: Duration(milliseconds: 3000));
    } catch (e) {
      print(e);
      return Future.error('Can\'t connect to socket.');
    }
    print('Connected to the server!');
    return Future.value(this._socket);
  }

  void closeSocket() {
    if (this._socket == null) return;
    this._listener.cancel();
    this._socket!.destroy();
    print('Disconnected');
  }

  void listen(Function(MessageModel)? onMessage, Function onError) async {
    if (this._socket == null) throw ("Trying to listen but socket is null");
    this._listener = this._socket!.listen((event) {
      // As json
      Map<String, dynamic>? msgJson = Protocol.onData(event);
      if (msgJson != null) {
        // Convert to MessageModel
        MessageModel msgModel = MessageModel.fromJson(msgJson);
        onMessage!(msgModel);
      }
    }, onError: (e) {
      this.closeSocket();
      onError(e);
    }, cancelOnError: true);
  }

  void sendMessage(MessageModel msg) {
    var data = msg.toJson();

    print(json.encode(data));
    this._socket!.write(Protocol.toData(json.encode(data)));
  }
}

class Protocol {
  static String buffer = '';
  static int? length;

  static Map<String, dynamic>? onData(Uint8List data) {
    buffer = buffer + String.fromCharCodes(data);

    if (length == null && buffer.contains(';')) {
      length = int.parse(buffer.split(';')[0]);
      buffer = buffer.split(';')[1];
    }

    if (buffer.length == length) {
      length = null;
      var data = jsonDecode(buffer);
      buffer = '';
      return data;
    }
    return null;
  }

  static Object toData(String data) {
    return '${data.length.toString()};$data';
  }
}
