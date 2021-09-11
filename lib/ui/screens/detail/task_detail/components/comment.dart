import 'package:flutter/material.dart';

class Comment extends StatelessWidget {
  const Comment({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(),
        _buildMemberComment(),
        Text(""),
        _buildMemberComment(),
        Container(),
      ],
    );
  }

  Row _buildMemberComment() => Row();
}