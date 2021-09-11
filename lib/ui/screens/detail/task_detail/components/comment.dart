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
        SizedBox(height: 36),
        _buildMemberComment(),
        Text(
          "Lorem ipsum dolor sit amet,consectetur adipiscing.",
          style: TextStyle(fontSize: 16, height: 1.5),
        ),
        SizedBox(height: 24),
        _buildMemberComment(),
        Container(
          height: 180,
          margin: EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
            image: DecorationImage(
              image: AssetImage("assets/images/comment_photo.jpg"),
              fit: BoxFit.cover,
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
          margin: EdgeInsets.zero,
          padding: EdgeInsets.all(16),
          height: 90,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(5),
            ),
            border: Border.all(color: Color(0xFFEAEAEA)),
          ),
          child: TextField(
            maxLines: 3,
            decoration: InputDecoration(
              hintText: "Write a commet",
              hintStyle: TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              contentPadding: EdgeInsets.zero,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.zero,
          padding: EdgeInsets.symmetric(horizontal: 16),
          height: 50,
          decoration: BoxDecoration(
            color: Color(0xFFF8F8F8),
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(5),
            ),
            border: Border.all(color: Color(0xFFEAEAEA)),
          ),
          child: Row(
            children: [
              SvgPicture.asset(
                "assets/icons/photo_icon.svg",
                width: 22,
              ),
              SizedBox(
                width: 20,
              ),
              SvgPicture.asset(
                "assets/icons/attach_icon.svg",
                width: 22,
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
