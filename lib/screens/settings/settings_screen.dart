import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:untitled/constants.dart';
import 'package:untitled/global.dart';
import 'package:untitled/screens/components/simple_button.dart';
import 'package:untitled/screens/components/simple_textfield.dart';
import 'package:untitled/screens/setupIP/setup_ip_screen.dart';

class SettingsScreen extends StatelessWidget {
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar('Settings', context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Connected to:",
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(color: secondaryColor),
                ),
                Text("${Global().server.ip}:${Global().server.port}",
                    textAlign: TextAlign.right,
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(color: Color(0xFF727272)))
              ],
            ),
            SizedBox(
              height: 35,
            ),
            SimpleButton(
              text: 'Change Server',
              press: () {
                Global().client.closeSocket();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (builder) => SetupIPScreen(back: false)));
              },
              padding: EdgeInsets.symmetric(horizontal: 90, vertical: 15),
            ),
            SizedBox(
              height: 70,
            ),
            Row(
              children: [
                Text('Name',
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(color: secondaryColor)),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SimpleTextField(
                  hint: Global().username!,
                  width: MediaQuery.of(context).size.width * 0.5,
                  controller: textEditingController,
                  validate: validateName,
                ),
                SizedBox(
                  width: 30,
                ),
                SimpleButton(
                    text: 'Set',
                    press: () {
                      var text = textEditingController.text;
                      if (validateName(text)) {
                        Global().username = text;
                        textEditingController.clear();
                        Navigator.pop(context);
                      }
                    })
              ],
            )
          ],
        ),
      ),
    );
  }
}

bool validateName(String text) {
  return text.length >= 3 && text.length <= 16;
}

AppBar buildAppBar(var title, var context) {
  return AppBar(
    centerTitle: true,
    toolbarHeight: 100,
    automaticallyImplyLeading: false,
    leading: IconButton(
      icon: Icon(
        Icons.arrow_back_ios,
        size: 30,
      ),
      onPressed: () => Navigator.pop(context),
      color: secondaryColor,
    ),
    title: Text(
      title,
      style: TextStyle(
        color: secondaryColor,
        fontSize: 23,
      ),
    ),
  );
}
