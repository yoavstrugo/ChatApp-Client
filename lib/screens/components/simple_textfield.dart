import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class SimpleTextField extends StatefulWidget {
  const SimpleTextField(
      {Key? key,
      this.color = const Color(0xFFE9EFFD),
      this.width = 150,
      this.height = 70,
      this.inputType = TextInputType.text,
      this.padding = const EdgeInsets.symmetric(vertical: 17, horizontal: 22),
      this.controller,
      this.validate,
      required this.hint});

  final Color color;
  final String hint;
  final double width;
  final double height;
  final TextInputType inputType;
  final EdgeInsets padding;
  final TextEditingController? controller;
  final Function(String)? validate;

  @override
  _SimpleTextFieldState createState() => _SimpleTextFieldState();
}

class _SimpleTextFieldState extends State<SimpleTextField> {
  bool valid = true;

  void checkInput(String input) {
    if (this.widget.validate == null) return;
    setState(() {
      valid = this.widget.validate!(input);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //height: this.widget.height,
      width: this.widget.width,
      child: TextField(
          textAlignVertical: TextAlignVertical.center,
          controller: this.widget.controller,
          keyboardType: this.widget.inputType,
          onChanged: (value) => this.checkInput(value),
          cursorColor: Colors.black12,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
              contentPadding: this.widget.padding,
              fillColor: this.widget.color,
              filled: true,
              errorText: !valid ? '' : null,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                  borderSide: const BorderSide(width: 0)),
              isDense: true,
              //focusedBorder: InputBorder.none,
              //enabledBorder: InputBorder.none,
              //errorBorder: InputBorder.none,
              //disabledBorder: InputBorder.none,
              //errorBorder: InputBorder.none,
              hintText: this.widget.hint)),
    );
  }
}
