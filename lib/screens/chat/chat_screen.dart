import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:amazingchatapp/constants.dart';
import 'package:amazingchatapp/global.dart';
import 'package:amazingchatapp/models/message_model.dart';
import 'package:amazingchatapp/screens/chat/components/chat_input_field.dart';
import 'package:amazingchatapp/screens/chat/components/message.dart';
import 'package:amazingchatapp/screens/chat/components/message_view.dart';
import 'package:amazingchatapp/screens/error/error_screen.dart';
import 'package:amazingchatapp/screens/settings/settings_screen.dart';

class ChatScreen extends StatefulWidget {
  ChatScreen({Key? key, required this.title, this.back = true});

  final String title;
  final bool back;

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<Message> messages = List.empty(growable: true);
  final TextEditingController textEditingController = TextEditingController();
  final ScrollController scrollController = ScrollController();

  void addMessage(MessageModel model) {
    var msg;
    if (model.author == 'Me')
      msg = Message(model);
    else
      msg = Message(
        model,
        color: foregroundColor,
        direction: MessageDirection.LEFT,
        textColor: secondaryTextColor,
      );
    setState(() {
      this.messages.add(msg);
    });
    scrollToBottom();
  }

  void scrollToBottom() {
    scrollController.animateTo(scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
  }

  void onSend(TextEditingController controller) {
    var text = controller.text;
    if (text.length == 0) return;

    // Send the message to the server
    Global().client.sendMessage(MessageModel(
        content: text, time: DateTime.now(), author: Global().username!));

    // Send the message to me
    this.addMessage(
        MessageModel(content: text, time: DateTime.now(), author: 'Me'));

    controller.clear(); // Clear the text box
  }

  @override
  void initState() {
    super.initState();
    Global().client.listen(this.addMessage, (e) {
      print(e);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (builder) => ErrorScreen(
                    description: "Server has disconnected!",
                  )));
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => this.widget.back,
      child: Scaffold(
          appBar: buildAppBar(widget.title, context),
          body: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(41)),
                    color: primaryColor),
                width: double.infinity,
                padding: EdgeInsets.only(right: 15, left: 15, top: 20),
                child: MessageView(
                  messages: messages,
                  controller: scrollController,
                ),
              ),
              Positioned(
                  bottom: 36,
                  child: Container(
                      child: ChatInputField(
                    onSend: (controller) => this.onSend(controller),
                    onOpen: this.scrollToBottom,
                  )))
            ],
          )),
    );
  }
}

AppBar buildAppBar(var title, var context) {
  return AppBar(
    centerTitle: true,
    toolbarHeight: 100,
    automaticallyImplyLeading: false,
    leading: IconButton(
      icon: Icon(
        appIcon,
        size: 30,
      ),
      onPressed: () => Navigator.push(
          context, MaterialPageRoute(builder: (builder) => SettingsScreen())),
      color: secondaryColor,
    ),
    title: Text(
      title,
      style: TextStyle(
        color: secondaryColor,
        fontSize: 23,
      ),
    ),
  );
}
