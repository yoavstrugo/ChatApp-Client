import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:untitled/constants.dart';
import 'package:untitled/screens/components/simple_button.dart';
import 'package:untitled/screens/components/simple_textfield.dart';
import 'package:untitled/global.dart';
import 'package:untitled/screens/components/texticon_button.dart';
import 'package:untitled/screens/error/error_screen.dart';
import 'package:untitled/screens/successfullyConnected/successfully_connected_screen.dart';

class SetupPortScreen extends StatelessWidget {
  SetupPortScreen({Key? key, this.back = true});

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
              Text('Enter the server\'s port',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: secondaryColor,
                      fontSize: 23)),
              SizedBox(
                height: 25,
              ),
              SimpleTextField(
                hint: 'xxxxx',
                width: 135,
                controller: controller,
                validate: this.validatePort,
              ),
              Spacer(flex: 5),
              SimpleButton(
                  text: 'Connect',
                  press: () async {
                    // Get the text
                    String text = controller.text;

                    // Validate its port
                    if (validatePort(text)) {
                      // Set the text
                      Global().server.port = int.parse(text);

                      // Connect to the server
                      try {
                        await Global().client.initSocket();

                        // Navigate to next page
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    SuccessfullyConnectedScreen(
                                      back: false,
                                    )));
                      } catch (e) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ErrorScreen(
                                      description:
                                          'Couldn\'t connect to server!',
                                    )));
                      }
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
      ),
    );
  }

  bool validatePort(String text) {
    RegExp match = RegExp(
        r"^([0-9]{1,4}|[1-5][0-9]{4}|6[0-4][0-9]{3}|65[0-4][0-9]{2}|655[0-2][0-9]|6553[0-5])$");
    return match.hasMatch(text);
  }
}
