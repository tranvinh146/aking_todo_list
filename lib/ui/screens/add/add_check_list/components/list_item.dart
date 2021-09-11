import 'package:flutter/material.dart';

import '../../../../../others/constant.dart';

class ListItem extends StatelessWidget {
  const ListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        ListView.separated(
          shrinkWrap: true,
          itemCount: 4,
          itemBuilder: (context, index) => _buildItem(index),
          separatorBuilder: (context, index) => SizedBox(height: 24),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 24.0),
          child: GestureDetector(
            onTap: () {},
            child: Text(
              "+ Add new Item",
              style: TextStyle(
                color: blackPrimaryColor,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Row _buildItem(int index) {
    return Row(
      children: [
        Container(
          height: 20,
          width: 20,
          margin: EdgeInsets.only(right: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(3),
            ),
            color: Color(0xFFF4F4F4),
            border: Border.all(
              color: Color(0xFF979797),
            ),
          ),
        ),
        Text(
          "List Item $index",
          style: TextStyle(
            color: blackPrimaryColor,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
