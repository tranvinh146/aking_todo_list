import 'package:aking_to_do_list/ui/screens/init/onbroading/onbroading_screen.dart';
import 'package:flutter/material.dart';

import 'components/body.dart';

class SplashScreen extends StatefulWidget {
  static String routeName = '/splash';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  _navigateToOnbroading() async {
    await Future.delayed(Duration(seconds: 4));
    Navigator.pushReplacementNamed(context, OnbroadingScreen.routeName);
  }

  @override
  void didChangeDependencies() {
    _navigateToOnbroading();
    super.didChangeDependencies();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
