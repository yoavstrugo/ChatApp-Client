import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:amazingchatapp/constants.dart';
import 'package:amazingchatapp/screens/components/simple_button.dart';
import 'package:amazingchatapp/screens/setupIP/setup_ip_screen.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Spacer(flex: 5),
            SizedBox(
              width: double.infinity,
            ),
            Text('Welcome to',
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(fontWeight: FontWeight.w700)),
            Text('TAWKI',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline3!.copyWith(
                    fontWeight: FontWeight.w900, color: secondaryColor)),
            SizedBox(
              height: 15,
            ),
            SizedBox(
                width: 282,
                child: Text(
                    'You can talk to other people using the best chat app ever.',
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontWeight: FontWeight.w400, fontSize: 17))),
            Spacer(flex: 2),
            SimpleButton(
                text: 'Get Started',
                press: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SetupIPScreen()))),
            Spacer(flex: 5),
          ],
        ),
      ),
    );
  }
}
