import 'package:flutter/material.dart';

import '../../others/constant.dart';

class ColorPicker extends StatefulWidget {
  final Function? onSelectColor;
  final List<Color>? availablaColors;
  const ColorPicker({
    Key? key,
    required this.availablaColors,
    required this.onSelectColor,
  }) : super(key: key);

  @override
  _ColorPickerState createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  Color? _pickedColor;

  @override
  void initState() {
    _pickedColor = widget.availablaColors![0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Choose Color",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: blackPrimaryColor,
          ),
        ),
        SizedBox(height: 18),
        Container(
          height: 50,
          width: double.infinity,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.availablaColors!.length,
            itemBuilder: (context, index) {
              final itemColor = widget.availablaColors![index];
              return InkWell(
                onTap: () {
                  widget.onSelectColor!(itemColor);
                  setState(() {
                    _pickedColor = itemColor;
                  });
                },
                child: Container(
                  height: 48,
                  width: 48,
                  margin: EdgeInsets.only(right: 12),
                  decoration: BoxDecoration(
                    color: itemColor,
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  child: itemColor == _pickedColor
                      ? Center(
                          child: Icon(
                            Icons.check,
                            size: 25,
                            color: Colors.white,
                          ),
                        )
                      : SizedBox(),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
