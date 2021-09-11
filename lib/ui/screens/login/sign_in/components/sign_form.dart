import 'package:aking_to_do_list/ui/components/default_button.dart';
import 'package:aking_to_do_list/ui/components/input_label.dart';
import 'package:aking_to_do_list/ui/screens/home/my_task/my_task_screen.dart';
import 'package:aking_to_do_list/ui/screens/login/forgot_password/forgot_password_screen.dart';
import 'package:flutter/material.dart';

import '../../../../../others/constant.dart';

class SignForm extends StatefulWidget {
  const SignForm({Key? key}) : super(key: key);

  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InputLabel("Username"),
                buildEmailFormField(),
                SizedBox(
                  height: 32,
                ),
                InputLabel("Password"),
                buildPasswordFormField(),
                buildForgotPassword(context),
                SizedBox(height: 80),
                DefaultButton(
                  "Log In",
                  press: _onClickLogin,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container buildForgotPassword(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(top: 12.0),
      child: GestureDetector(
        onTap: () =>
            Navigator.pushNamed(context, ForgotPasswordScreen.routeName),
        child: Text(
          "Forgot password",
          textAlign: TextAlign.end,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      onSaved: (newValue) => email = newValue,
      validator: (value) {
        if (value!.isEmpty) {
          return kEmailEmptyError;
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          return kInvalidEmailError;
        }
        return null;
      },
      keyboardType: TextInputType.emailAddress,
      cursorColor: blackPrimaryColor,
      style: TextStyle(
        color: blackPrimaryColor,
        fontSize: 16,
      ),
      decoration: InputDecoration(
        hintText: "Enter your email",
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      onSaved: (newValue) => password = newValue,
      validator: (value) {
        if (value!.isEmpty) {
          return kPassEmptyError;
        } else if (value.length < 6) {
          return kShortPassError;
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
        hintText: "Enter your password",
      ),
    );
  }

  _onClickLogin() {
    // if (_formKey.currentState!.validate()) {
    //   _formKey.currentState!.save();
    //   Navigator.pushNamedAndRemoveUntil(
    //       context, HomeScreen.routeName, (Route<dynamic> route) => false);
    // }
    if (true) {
      Navigator.pushNamedAndRemoveUntil(
          context, MyTaskScreen.routeName, (Route<dynamic> route) => false);
    }
  }
}
