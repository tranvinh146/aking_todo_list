import 'package:aking_to_do_list/others/constant.dart';
import 'package:aking_to_do_list/ui/components/color_picker.dart';
import 'package:flutter/material.dart';

class AddProjectDialog {
  static void show(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        insetPadding: EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _buildDescriptionField(),
              _buildChooseColor(),
            ],
          ),
        ),
      ),
    );
  }

  static _buildChooseColor() {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 0, bottom: 30),
      child: ColorPicker(
        availablaColors: [
          Color(0xFF6074F9),
          Color(0xFFE42B6A),
          Color(0xFF5ABB56),
          Color(0xFF3D3A62),
          Color(0xFFF4CA8F),
        ],
        onSelectColor: (value) {
          print(value);
        },
      ),
    );
  }

  static _buildDescriptionField() {
    return Container(
      padding: EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Title",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: blackPrimaryColor,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 70,
            width: double.infinity,
            child: TextField(
              maxLines: 3,
              style: TextStyle(
                height: 1.5,
                fontSize: 16,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                contentPadding: EdgeInsets.zero,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
