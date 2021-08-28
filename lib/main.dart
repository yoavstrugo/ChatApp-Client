import 'package:flutter/material.dart';
import 'package:untitled/screens/chat/chat_screen.dart';
import 'package:untitled/screens/welcome/welcome_screen.dart';
import 'package:untitled/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            //currentFocus.unfocus();
            FocusScope.of(context).requestFocus(new FocusNode());
          }
        },
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: lightThemeData(context),
          debugShowCheckedModeBanner: false,
          home: WelcomeScreen(),
        ));
  }
}
