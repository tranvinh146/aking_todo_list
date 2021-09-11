import 'package:aking_to_do_list/ui/components/dialog/add_dialog.dart';
import 'package:aking_to_do_list/ui/screens/home/my_task/my_task_screen.dart';
import 'package:aking_to_do_list/ui/screens/home/menu/menu_screen.dart';
import 'package:aking_to_do_list/ui/screens/home/profile/profile_screen.dart';
import 'package:aking_to_do_list/ui/screens/home/quick/quick_screen.dart';
import 'package:flutter/material.dart';

import '../../../others/constant.dart';

class CustomBottomBar extends StatelessWidget {
  final int? currentPage;
  const CustomBottomBar({
    Key? key,
    this.currentPage = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 95,
      child: Stack(
        children: [
          Container(
            alignment: Alignment.bottomCenter,
            color: Colors.transparent,
            child: Container(
              height: 80,
              width: double.infinity,
              color: Color(0xFF292E4E),
              padding: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  buildItem(
                    0,
                    "My Task",
                    Icons.check_circle,
                    () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, MyTaskScreen.routeName, (route) => false);
                    },
                  ),
                  buildItem(
                    1,
                    "Menu",
                    Icons.menu,
                    () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, MenuScreen.routeName, (route) => false);
                    },
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  buildItem(
                    2,
                    "Quick",
                    Icons.content_paste,
                    () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, QuickScreen.routeName, (route) => false);
                    },
                  ),
                  buildItem(
                    3,
                    "Profile",
                    Icons.account_circle,
                    () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, ProfileScreen.routeName, (route) => false);
                    },
                  ),
                ],
              ),
            ),
          ),
          Center(
            heightFactor: 1.1,
            child: FloatingActionButton(
              elevation: 0,
              backgroundColor: redPrimaryColor,
              onPressed: () {
                AddDialog.showAddDialog(context);
              },
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  InkWell buildItem(int index, String label, IconData icon, Function() press) {
    return InkWell(
      onTap: press,
      child: Column(
        children: [
          Icon(
            icon,
            size: 24,
            color: index == currentPage
                ? Colors.white
                : Colors.white.withOpacity(0.5),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: index == currentPage
                  ? Colors.white
                  : Colors.white.withOpacity(0.5),
            ),
          ),
        ],
      ),
    );
  }
}
