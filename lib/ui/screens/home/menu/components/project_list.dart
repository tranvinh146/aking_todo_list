import 'package:aking_to_do_list/others/constant.dart';
import 'package:flutter/material.dart';

import 'project_card.dart';

class ProjectList extends StatelessWidget {
  const ProjectList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> projectList = [
      {
        "name": "Personal",
        "amount": "10",
        "color": bluePrimaryColor,
      },
      {
        "name": "Teamworks",
        "amount": "5",
        "color": redPrimaryColor,
      },
      {
        "name": "Home",
        "amount": "10",
        "color": Colors.greenAccent,
      },
      {
        "name": "Meet",
        "amount": "10",
        "color": purplePrimaryColor,
      },
    ];
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 13,
        mainAxisSpacing: 24,
        childAspectRatio: 0.915,
      ),
      itemCount: projectList.length,
      itemBuilder: (context, index) {
        return ProjectCard(
          name: projectList[index]["name"],
          color: projectList[index]["color"],
          amount: projectList[index]["amount"],
        );
      },
    );
  }
}
