import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:amazingchatapp/constants.dart';

class SimpleButton extends StatelessWidget {
  const SimpleButton(
      {Key? key,
      required this.text,
      required this.press,
      this.color = secondaryColor,
      this.textColor = primaryTextColor,
      this.padding = const EdgeInsets.symmetric(vertical: 15, horizontal: 35),
      this.elevation = 0});

  final String text;
  final VoidCallback press;
  final Color color;
  final Color textColor;
  final EdgeInsets padding;
  final double elevation;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(40)),
        ),
        elevation: this.elevation,
        color: this.color,
        padding: this.padding,
        child: Text(this.text,
            style: TextStyle(
                color: this.textColor,
                fontSize: 17,
                fontWeight: FontWeight.w600)),
        onPressed: this.press);
  }
}
