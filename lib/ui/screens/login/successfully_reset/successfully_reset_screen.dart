
import 'package:aking_to_do_list/ui/screens/home/my_task/my_task_screen.dart';
import 'package:flutter/material.dart';

import 'components/body.dart';

class SuccessfullyResetScreen extends StatefulWidget {
  static String routeName = "/successfully_reset";
  const SuccessfullyResetScreen({Key? key}) : super(key: key);

  @override
  _SuccessfullyResetScreenState createState() =>
      _SuccessfullyResetScreenState();
}

class _SuccessfullyResetScreenState extends State<SuccessfullyResetScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(Duration(seconds: 3));
    Navigator.pushNamedAndRemoveUntil(
        context, MyTaskScreen.routeName, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
