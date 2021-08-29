import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:amazingchatapp/constants.dart';
import 'package:amazingchatapp/screens/components/simple_button.dart';
import 'package:amazingchatapp/screens/setupName/setup_name_screen.dart';

class SuccessfullyConnectedScreen extends StatelessWidget {
  SuccessfullyConnectedScreen({Key? key, this.back = true});

  final bool back;

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();

    return WillPopScope(
      onWillPop: () async => this.back,
      child: Scaffold(
        backgroundColor: secondaryColor,
        body: SafeArea(
          child: Column(
            children: [
              Spacer(flex: 3),
              // USed so the column will take the whole page width
              SizedBox(
                width: double.infinity,
              ),
              Text('Successfully Connected!',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                      fontWeight: FontWeight.w700, color: primaryTextColor)),
              SizedBox(
                height: 20,
              ),
              SimpleButton(
                  text: 'Continue',
                  color: primaryColor,
                  textColor: secondaryColor,
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                  press: () {
                    // Navigate to next page
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SetupNameScreen(
                                  back: false,
                                )));
                  }),
              Spacer(flex: 3),
            ],
          ),
        ),
      ),
    );
  }

  void validateIP(String text) {
    // TODO: implement
  }
}
