import 'package:aking_to_do_list/ui/components/default_button.dart';
import 'package:aking_to_do_list/ui/components/input_label.dart';
import 'package:aking_to_do_list/ui/screens/login/successfully_reset/successfully_reset_screen.dart';
import 'package:flutter/material.dart';

import '../../../../../others/constant.dart';

class ResetPasswordForm extends StatefulWidget {
  const ResetPasswordForm({Key? key}) : super(key: key);

  @override
  _ResetPasswordFormState createState() => _ResetPasswordFormState();
}

class _ResetPasswordFormState extends State<ResetPasswordForm> {
  final _formKey = GlobalKey<FormState>();
  List<String> errors = [];
  String? code;
  String? password;
  String? confirmPassword;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InputLabel("Reset code"),
          buildCodeFormField(),
          SizedBox(height: 38),
          InputLabel("New password"),
          buildPasswordFormField(),
          SizedBox(height: 38),
          InputLabel("Confirm password"),
          buildConfirmPassFormField(),
          SizedBox(height: 68),
          DefaultButton(
            "Change Password",
            press: () {
              if(_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                Navigator.pushNamed(context, SuccessfullyResetScreen.routeName);
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildCodeFormField() {
    return TextFormField(
      onSaved: (newValue) => code = newValue,
      validator: (value) {
        if(value!.isEmpty) {
          return kCodeEmptyError;
        }
        return null;
      },
      keyboardType: TextInputType.number,
      cursorColor: blackPrimaryColor,
      style: TextStyle(
        color: blackPrimaryColor,
        fontSize: 16,
      ),
      decoration: InputDecoration(
        hintText: "Enter your number",
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      onSaved: (newValue) => password = newValue,
      validator: (value) {
        if(value!.isEmpty) {
          return kPassEmptyError;
        } else if (value.length < 6) {
          return kShortPassError;
        }
        password = value;
        return null;
      },
      cursorColor: blackPrimaryColor,
      obscureText: true,
      style: TextStyle(
        color: blackPrimaryColor,
        fontSize: 16,
      ),
      decoration: InputDecoration(
        hintText: "Enter your password",
      ),
    );
  }

  TextFormField buildConfirmPassFormField() {
    return TextFormField(
      onSaved: (newValue) => confirmPassword = newValue,
      validator: (value) {
        if(value != password) {
          return kMatchPassError;
        }
        return null;
      },
      cursorColor: blackPrimaryColor,
      obscureText: true,
      style: TextStyle(
        color: blackPrimaryColor,
        fontSize: 16,
      ),
      decoration: InputDecoration(
        hintText: "Enter your confirm password",
      ),
    );
  }
}
