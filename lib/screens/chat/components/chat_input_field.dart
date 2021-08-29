import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:amazingchatapp/constants.dart';

class ChatInputField extends StatelessWidget {
  ChatInputField({Key? key, required this.onSend, this.onOpen});

  final TextEditingController controller = TextEditingController();
  final Function(TextEditingController) onSend;
  final Function()? onOpen;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      width: 360,
      constraints: BoxConstraints(minHeight: 58, maxHeight: 130),
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
      decoration: BoxDecoration(
          color: foregroundColor, borderRadius: BorderRadius.circular(41)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: TextField(
            controller: this.controller,
            textAlign: TextAlign.left,
            keyboardType: TextInputType.multiline,
            style: TextStyle(fontSize: 15),
            maxLines: null,
            decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                hintText: 'Message...'),
          )),
          SizedBox(
              child: IconButton(
                  onPressed: () => this.onSend(this.controller),
                  icon: Icon(Icons.send)))
        ],
      ),
    ));
  }
}
