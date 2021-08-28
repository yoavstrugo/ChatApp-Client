import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:untitled/constants.dart';
import 'package:untitled/models/message_model.dart';

enum MessageDirection { RIGHT, LEFT }

/// Represents a simple text message
class Message extends StatelessWidget {
  final MessageModel model;

  final Color color;

  final Color textColor;

  final MessageDirection direction;

  Message(
    this.model, {
    Key? key,
    this.color = secondaryColor,
    this.textColor = primaryTextColor,
    this.direction = MessageDirection.RIGHT,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 300),
        child: Column(
            crossAxisAlignment: this.direction == MessageDirection.RIGHT
                ? CrossAxisAlignment.end
                : CrossAxisAlignment.start,
            children: [
              // Message body
              Container(
                constraints: BoxConstraints(minWidth: 100, minHeight: 30),
                //alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                decoration: BoxDecoration(
                    color: this.color,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(54),
                        topRight: Radius.circular(54),
                        bottomLeft: this.direction == MessageDirection.RIGHT
                            ? Radius.circular(54)
                            : Radius.zero,
                        bottomRight: this.direction == MessageDirection.LEFT
                            ? Radius.circular(54)
                            : Radius.zero)),
                child: Text(
                  this.model.content,
                  style: TextStyle(
                    color: this.textColor,
                    fontSize: 15,
                  ),
                ),
              ),
              // Message Data (Author and Time)
              SizedBox(
                  height:
                      6), // Add a space of 6px between the message and the data
              Row(
                mainAxisAlignment: this.direction == MessageDirection.RIGHT
                    ? MainAxisAlignment.end
                    : MainAxisAlignment.start,
                children: [
                  Text(dateFormat.format(this.model.time),
                      style: TextStyle(
                          fontFamily: 'Segoe UI',
                          fontSize: 13,
                          color: Color.fromRGBO(133, 140, 156, 1))),
                  SizedBox(
                      width:
                          10), // Add a space of 610px between time and author
                  Text(this.model.author,
                      style: TextStyle(
                          fontFamily: 'Segoe UI',
                          fontSize: 13,
                          color: Color.fromRGBO(133, 140, 156, 1)))
                ],
              )
            ]));
  }
}
