import 'package:flutter/material.dart';

const redPrimaryColor = Color(0xFFF96060);
const bluePrimaryColor = Color(0xFF6074F9);
const purplePrimaryColor = Color(0xFF8560F9);
const blackPrimaryColor = Color(0xFF313131);

const blackSecondaryColor = Color(0xFF1E201D);
const greyColor = Color(0xFFF4F4F4);

final TextStyle headingStyle = TextStyle(
  fontSize: 32,
  fontWeight: FontWeight.bold,
);

final TextStyle descriptionStyle = TextStyle(
  color: Color(0xFF9B9B9B),
  fontSize: 16.0,
  fontWeight: FontWeight.bold,
);

final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailEmptyError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassEmptyError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kCodeEmptyError = "Please Enter your code";
