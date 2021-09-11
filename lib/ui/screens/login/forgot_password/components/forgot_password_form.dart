import 'package:aking_to_do_list/ui/components/default_button.dart';
import 'package:aking_to_do_list/ui/components/input_label.dart';
import 'package:aking_to_do_list/ui/screens/login/reset_password/reset_password_screen.dart';
import 'package:flutter/material.dart';

import '../../../../../others/constant.dart';



class ForgotPassForm extends StatefulWidget {
  const ForgotPassForm({Key? key}) : super(key: key);

  @override
  _ForgotPassFormState createState() => _ForgotPassFormState();
}

class _ForgotPassFormState extends State<ForgotPassForm> {
  final _formKey = GlobalKey<FormState>();
  List<String> errors = [];
  String? email;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InputLabel("Username"),
          buildEmailFormField(),
          SizedBox(height: 32),
          DefaultButton(
            "Send Request",
            press: () {
              if(_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                Navigator.pushNamed(context, ResetPasswordScreen.routeName);
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      onSaved: (newValue) => email = newValue,
      validator: (value) {
        if(value!.isEmpty) {
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
}
