import 'package:aking_to_do_list/others/constant.dart';
import 'package:flutter/material.dart';

import 'statistic_circle.dart';
import 'task_info_card.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> taskInfoData = [
      {
        "name": "Events",
        "amount": "12",
        "completed": "60%",
        "color": redPrimaryColor,
      },
      {
        "name": "To do Task",
        "amount": "16",
        "completed": "40%",
        "color": bluePrimaryColor,
      },
      {
        "name": "Quick Notes",
        "amount": "14",
        "completed": "80%",
        "color": purplePrimaryColor,
      }
    ];
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildUserInfoCard(),
        _buildTaskInfo(taskInfoData),
        _buildStatistic(taskInfoData)
      ],
    );
  }

  Container _buildStatistic(List<Map<String, dynamic>> taskInfoData) {
    return Container(
      height: 205,
      margin: EdgeInsets.symmetric(horizontal: 16),
      padding: EdgeInsets.only(top: 16, left: 26),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Statistic",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: blackPrimaryColor,
            ),
          ),
          Container(
            height: 115,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: taskInfoData.length,
              itemBuilder: (context, index) {
                return StatisticCircle(
                  name: taskInfoData[index]["name"],
                  completed: taskInfoData[index]["completed"],
                  color: taskInfoData[index]["color"],
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(width: 28);
              },
            ),
          ),
        ],
      ),
    );
  }

  Container _buildTaskInfo(List<Map<String, dynamic>> taskInfoData) {
    return Container(
      margin: EdgeInsets.only(left: 20),
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: taskInfoData.length,
        itemBuilder: (context, index) {
          return TaskInfoCard(
            name: taskInfoData[index]["name"],
            amount: taskInfoData[index]["completed"],
            color: taskInfoData[index]["color"],
          );
        },
      ),
    );
  }

  Container _buildUserInfoCard() {
    return Container(
      height: 190,
      width: double.infinity,
      margin: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 30,
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 2),
              blurRadius: 10,
              color: Color(0xFFE0E0E0).withOpacity(0.5),
            )
          ]),
      child: Stack(
        children: [
          Positioned(
            top: 10,
            right: 10,
            child: Icon(
              Icons.settings,
              size: 20,
              color: Colors.black,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 0, 10, 0),
                    height: 64,
                    width: 64,
                    decoration: BoxDecoration(
                      color: greyColor,
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage("assets/images/avatar.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  _buildTextInfo("Tran Vinh", "tranvinhlx135@gmail.com"),
                ],
              ),
              Row(
                children: [
                  _buildTextInfo("120", "Create Tasks"),
                  _buildTextInfo("80", "Completed Tasks"),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  Padding _buildTextInfo(String text1, String text2) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text1,
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
          ),
          Text(
            text2,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
