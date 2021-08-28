import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:untitled/constants.dart';
import 'package:untitled/screens/components/simple_button.dart';
import 'package:untitled/screens/components/simple_textfield.dart';
import 'package:untitled/global.dart';
import 'package:untitled/screens/components/texticon_button.dart';
import 'package:untitled/screens/setupPort/setup_port_screen.dart';

class SetupIPScreen extends StatelessWidget {
  const SetupIPScreen({Key? key, this.back = true});

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
                Text('Enter the server\'s IP address',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                        fontWeight: FontWeight.w600,
                        color: secondaryColor,
                        fontSize: 23)),
                SizedBox(
                  height: 25,
                ),
                SimpleTextField(
                  hint: 'xxx.xxx.xxx.xxx',
                  width: 305,
                  controller: controller,
                  validate: validateIP,
                ),
                Spacer(flex: 5),
                SimpleButton(
                    text: 'Continue',
                    press: () {
                      var text = controller.text;
                      // Validate ip
                      if (validateIP(text)) {
                        // Set the ip
                        Global().server.ip = text;

                        // Navigate to next page
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SetupPortScreen()));
                      }
                    }),
                SizedBox(
                  height: 15,
                ),
                if (this.back)
                  TextIconButton(() {
                    Navigator.pop(context);
                  }),
                Spacer(flex: 3),
              ],
            ),
          ),
        ));
  }

  bool validateIP(String text) {
    // Regex that matches ip addresses
    RegExp match = RegExp(
        r"^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$");
    return match.hasMatch(text);
  }
}
