import 'package:aking_to_do_list/ui/components/footer/custom_bottom_bar.dart';
import 'package:flutter/material.dart';

import 'components/body.dart';

class MenuScreen extends StatelessWidget {
  static final routeName = "/menu";
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Projects",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(25),
          child: Container(),
        ),
      ),
      body: Body(),
      bottomNavigationBar: CustomBottomBar(
        currentPage: 1,
      ),
    );
  }
}
