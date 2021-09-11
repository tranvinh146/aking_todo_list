import 'package:aking_to_do_list/others/constant.dart';
import 'package:aking_to_do_list/ui/components/default_button.dart';
import 'package:aking_to_do_list/ui/screens/login/sign_in/sign_in_screen.dart';
import 'package:flutter/material.dart';

import 'content.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int _currentPage = 0;
  List<Map<String, String>> onbroadingData = [
    {
      "image": "assets/images/intro_1.png",
      "title": "Welcome to aking",
      "text": "Whats going to happen tomorrow?",
    },
    {
      "image": "assets/images/intro_2.png",
      "title": "Work happens",
      "text": "Get notified when work happens.",
    },
    {
      "image": "assets/images/intro_3.png",
      "title": "Tasks and assign",
      "text": "Task and assign them to colleagues.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
                flex: 3,
                child: PageView.builder(
                    onPageChanged: (value) {
                      setState(() {
                        _currentPage = value;
                      });
                    },
                    itemCount: onbroadingData.length,
                    itemBuilder: (context, index) => Content(
                          image: onbroadingData[index]["image"],
                          title: onbroadingData[index]["title"],
                          text: onbroadingData[index]["text"],
                        ))),
            Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        onbroadingData.length,
                        (index) => buildDot(index),
                      ),
                    ),
                    Spacer(),
                    Container(
                      child: Stack(alignment: Alignment.center, children: [
                        IndexedStack(
                          index: _currentPage,
                          children: [
                            buildImage('assets/images/red_footer.png'),
                            buildImage('assets/images/blue_footer.png'),
                            buildImage('assets/images/purple_footer.png')
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 41.0),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 40,
                              ),
                              DefaultButton(
                                "Get Started",
                                backgroundColor: Colors.white,
                                textColor: blackPrimaryColor,
                                press: _onClick,
                              ),
                              SizedBox(
                                height: 32,
                              ),
                              DefaultButton(
                                "Log In",
                                backgroundColor: Color(0x00000000),
                                textColor: Colors.white,
                                press: _onClick,
                              )
                            ],
                          ),
                        ),
                      ]),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }

  Image buildImage(String image) {
    return Image.asset(
      image,
      width: double.infinity,
      fit: BoxFit.fill,
    );
  }

  AnimatedContainer buildDot(int index) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 1500),
      margin: EdgeInsets.only(right: 8.0),
      height: 8,
      width: 8,
      decoration: BoxDecoration(
        color: _currentPage == index ? Colors.black : Color(0x33000000),
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }

  _onClick(){
    Navigator.pushNamed(context, SignInScreen.routeName);
  }
}

