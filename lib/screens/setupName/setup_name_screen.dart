import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:untitled/constants.dart';
import 'package:untitled/screens/chat/chat_screen.dart';
import 'package:untitled/screens/components/simple_button.dart';
import 'package:untitled/screens/components/simple_textfield.dart';
import 'package:untitled/global.dart';

class SetupNameScreen extends StatelessWidget {
  SetupNameScreen({Key? key, this.back = true});

  final bool back;

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();

    return WillPopScope(
      onWillPop: () async => this.back,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Spacer(flex: 3),
              SizedBox(
                width: double.infinity,
              ),
              Text('What\'s your name?',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: secondaryColor,
                      fontSize: 23)),
              SizedBox(
                height: 25,
              ),
              SimpleTextField(
                hint: 'John Smith',
                width: 250,
                controller: controller,
                validate: validateName,
              ),
              Spacer(flex: 5),
              SimpleButton(
                  text: 'Start Chat',
                  press: () {
                    var text = controller.text;
                    if (validateName(text)) {
                      Global().username = text;

                      // Navigate to next page
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChatScreen(
                                    title: 'Chat',
                                    back: false,
                                  )));
                    }
                  }),
              Spacer(flex: 3),
            ],
          ),
        ),
      ),
    );
  }

  bool validateName(String text) {
    return text.length >= 3 && text.length <= 16;
  }
}
