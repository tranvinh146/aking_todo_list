import 'package:aking_to_do_list/ui/components/color_picker.dart';
import 'package:aking_to_do_list/ui/components/default_button.dart';
import 'package:flutter/material.dart';

import '../../../../../others/constant.dart';
import 'list_item.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildHeader(context),
        Positioned(
          child: Container(
            margin: EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(5)),
              boxShadow: [
                BoxShadow(
                  offset: Offset(3, 3),
                  blurRadius: 9,
                  color: Color(0xFFDDDDDD).withOpacity(0.5),
                ),
              ],
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildDescriptionField(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: ListItem(),
                  ),
                  _buildChooseColor(),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24.0,
                      vertical: 50,
                    ),
                    child: DefaultButton(
                      "Done",
                      press: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Padding _buildChooseColor() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 24,
      ),
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

  Positioned _buildHeader(BuildContext context) {
    return Positioned(
      top: 0,
      child: Container(
        height: 45,
        width: MediaQuery.of(context).size.width,
        color: redPrimaryColor,
      ),
    );
  }

  Container _buildDescriptionField() {
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
            height: 50,
            width: double.infinity,
            padding: EdgeInsets.zero,
            child: TextField(
              maxLines: 2,
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
