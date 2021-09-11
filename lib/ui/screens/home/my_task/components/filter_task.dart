
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'custom_popup_menu.dart';

class FilterTask extends StatelessWidget {
  final double? height;
  final double? width;
  const FilterTask({
    Key? key,
    this.height = 130,
    this.width = 230,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double appBarHeight = Scaffold.of(context).appBarMaxHeight!;
    final double deviceHeight = MediaQuery.of(context).size.height;
    final double deviceWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        CustomPopupMenu.showMenu(
          context,
          paddingBottom: deviceHeight - appBarHeight - height!,
          paddingTop: appBarHeight / 2,
          paddingLeft: deviceWidth - width! - 14,
          paddingRight: 14,
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 16),
        child: SvgPicture.asset(
          "assets/icons/config_icon.svg",
          width: 20,
        ),
      ),
    );
  }
}
