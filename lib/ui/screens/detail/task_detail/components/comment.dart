import 'package:aking_to_do_list/others/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Comment extends StatelessWidget {
  const Comment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildWriteComment(),
        _buildMemberComment(),
        Text(
          "Lorem ipsum dolor sit amet,consectetur adipiscing.",
          style: TextStyle(fontSize: 16),
        ),
        _buildMemberComment(),
        Container(
          height: 180,
          color: bluePrimaryColor,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
          ),
        )
      ],
    );
  }

  Row _buildMemberComment() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(right: 10),
          padding: EdgeInsets.zero,
          width: 32,
          height: 32,
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage("assets/images/avatar.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Stephen Chow",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "3 days ago",
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
          ],
        )
      ],
    );
  }

  Column _buildWriteComment() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 295,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(5),
            ),
            border: Border.all(),
          ),
        ),
        Container(
          padding: EdgeInsets.all(16),
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(5),
            ),
            border: Border.all(),
          ),
          child: Row(
            children: [
              SvgPicture.asset(
                "assets/icons/attach_icon.svg",
                width: 20,
              ),
              SvgPicture.asset(
                "assets/icons/photo_icon.svg",
                width: 20,
              ),
              Spacer(),
              Text(
                "Send",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: bluePrimaryColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
