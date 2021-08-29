import 'package:flutter/material.dart';
import 'package:amazingchatapp/constants.dart';

ThemeData lightThemeData(BuildContext context) {
  return ThemeData.light().copyWith(
      primaryColor: primaryColor,
      scaffoldBackgroundColor: foregroundColor,
      appBarTheme: AppBarTheme(
          backgroundColor: foregroundColor,
          centerTitle: false,
          elevation: 0,
          textTheme: Theme.of(context).textTheme.apply(fontFamily: fontFamily)),
      iconTheme: IconThemeData(color: secondaryColor),
      textTheme: Theme.of(context).textTheme.apply(fontFamily: fontFamily),
      colorScheme:
          ColorScheme.light(primary: primaryColor, secondary: secondaryColor));
}
