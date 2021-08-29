import 'package:flutter/material.dart';
import 'package:amazingchatapp/constants.dart';

class TextIconButton extends StatelessWidget {
  const TextIconButton(this.onPress,
      {Key? key, this.text = 'Back', this.icon = Icons.arrow_back_ios})
      : super(key: key);

  final String text;
  final IconData icon;
  final Function() onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onPress,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            this.icon,
            size: 15,
          ),
          Text(
            this.text,
            style: TextStyle(color: secondaryColor),
          ),
        ],
      ),
    );
  }
}
