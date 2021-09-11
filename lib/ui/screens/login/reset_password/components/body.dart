import 'package:flutter/material.dart';

import '../../../../../others/constant.dart';
import 'reset_password_form.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 40.0),
      child: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Reset Password",
                style: headingStyle,
              ),
              SizedBox(height: 12),
              Text(
                "Reset code was sent to your phone. Please enter the code and create new password",
                style: descriptionStyle,
              ),
              SizedBox(height: 48),
              ResetPasswordForm(),
            ],
          ),
        ),
      ),
    );
  }
}
