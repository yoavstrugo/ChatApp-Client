import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:untitled/constants.dart';
import 'package:untitled/screens/components/simple_button.dart';
import 'package:untitled/screens/setupIP/setup_ip_screen.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen(
      {Key? key,
      this.description = 'An error has occured!',
      this.btnText = 'Reconnect',
      this.page = const SetupIPScreen(back: false),
      this.back = false})
      : super(key: key);

  final String description;

  final String btnText;

  final Widget page;

  final bool back;

  @override
  Widget build(BuildContext context) {
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
              Text('Whoops!',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                      fontWeight: FontWeight.w700, color: secondaryColor)),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                  width: 282,
                  child: Text(this.description,
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(fontWeight: FontWeight.w300))),
              Spacer(flex: 2),
              SimpleButton(
                  text: this.btnText,
                  press: () {
                    // Navigate to next page
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => this.page));
                  }),
              Spacer(flex: 3),
            ],
          ),
        ),
      ),
    );
  }
}
