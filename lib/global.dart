import 'package:amazingchatapp/client.dart';
import 'package:amazingchatapp/models/server_model.dart';

class Global {
  static final Global _global = Global._internal();

  factory Global() {
    return _global;
  }

  Global._internal();

  bool DEBUG = false;

  final Server server = Server();
  String? username = 'Yoav';
  ChatClient client = ChatClient();
}
