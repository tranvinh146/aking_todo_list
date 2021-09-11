import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'constant.dart';

ThemeData themeData(){
  return ThemeData(
    appBarTheme: appBarTheme(),
    textTheme: textTheme(),
    inputDecorationTheme: inputDecorationTheme(),
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'AvenirNextRoundedPro',
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

AppBarTheme appBarTheme(){
  return AppBarTheme(
      color: Colors.white,
      elevation: 0,
      brightness: Brightness.light,
      iconTheme: IconThemeData(color: Colors.white),
      textTheme: TextTheme(
          headline6: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ))
  );
}

TextTheme textTheme(){
  return TextTheme(
    bodyText1: TextStyle(color: redPrimaryColor),
    bodyText2: TextStyle(color: blackPrimaryColor),
  );
}

InputDecorationTheme inputDecorationTheme() {
  return InputDecorationTheme(
    contentPadding: EdgeInsets.only(top: 15, bottom: 11),
    focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: blackPrimaryColor,
        )
    ),
  );
}
