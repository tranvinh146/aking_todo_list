import 'package:aking_to_do_list/ui/components/header/project_app_bar.dart';
import 'package:aking_to_do_list/ui/screens/detail/project_detail/project_detail_screen.dart';
import 'package:flutter/material.dart';

import '../../../../../others/constant.dart';

class ProjectCard extends StatelessWidget {
  final Color? color;
  final String? name, amount;
  const ProjectCard({
    Key? key,
    required this.color,
    required this.name,
    this.amount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamedAndRemoveUntil(
          context,
          ProjectDetailScreen.routeName,
          (route) => false,
          arguments: ProjectAppBar(name, color),
        );
      },
      child: Container(
        width: 165,
        height: 180,
        padding: EdgeInsets.all(24),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 2),
                  blurRadius: 10,
                  color: Color(0xFFE3E3E3).withOpacity(0.5))
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,
              width: 26,
              height: 26,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: color!.withOpacity(0.25),
              ),
              child: Icon(
                Icons.circle,
                size: 16,
                color: color,
              ),
            ),
            Text(
              name!,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: blackPrimaryColor,
                height: 4,
              ),
            ),
            Text(
              (amount ?? "0") + " Tasks",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
                height: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
