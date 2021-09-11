import 'package:aking_to_do_list/others/constant.dart';
import 'package:aking_to_do_list/ui/components/header/my_tab.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'custom_calendar.dart';
import 'task_list.dart';

class Body extends StatelessWidget {
  final Color? tabColor;
  const Body({
    Key? key,
    this.tabColor = redPrimaryColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyTab tab = Provider.of(context);
    return Column(
      children: [
        Container(
          height: 50,
          width: double.infinity,
          color: tabColor,
          padding: EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildTab(0, "Today", tab),
              _buildTab(1, "Monthly", tab),
            ],
          ),
        ),
        tab.tabIndex == 1 ? CustomCalendar() : SizedBox(),
        Expanded(
          child: TaskList(),
        ),
      ],
    );
  }

  InkWell _buildTab(int index, String name, MyTab tab) {
    return InkWell(
      onTap: () {
        tab.switchTab(index);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name,
            style: TextStyle(
              fontSize: 18,
              color: tab.tabIndex == index
                  ? Colors.white
                  : Colors.white.withOpacity(0.5),
            ),
          ),
          Container(
            height: 3,
            width: 100,
            color: tab.tabIndex == index ? Colors.white : Colors.transparent,
          ),
        ],
      ),
    );
  }
}
