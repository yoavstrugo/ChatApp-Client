import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:amazingchatapp/screens/chat/components/message.dart';

class MessageView extends StatelessWidget {
  final List<Message> messages;
  final ScrollController? controller;

  MessageView({Key? key, required this.messages, this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
      child: ListView.separated(
          //reverse: true,
          itemCount: this.messages.length,
          scrollDirection: Axis.vertical,
          controller: this.controller,
          padding: EdgeInsets.only(top: 80, bottom: 230),
          itemBuilder: (ctx, idx) {
            var msg = this.messages[idx];
            return Container(
                alignment: msg.direction == MessageDirection.RIGHT
                    ? Alignment.centerRight
                    : Alignment.centerLeft,
                child: this.messages[idx]);
          },
          separatorBuilder: (ctx, idx) => const SizedBox(
                height: 16,
              )),
    ));
  }
}
