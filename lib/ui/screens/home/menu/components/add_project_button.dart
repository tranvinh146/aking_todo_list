import 'package:aking_to_do_list/ui/screens/home/menu/components/add_project_dialog.dart';
import 'package:flutter/material.dart';

import '../../../../../others/constant.dart';

class AddProjectButton extends StatelessWidget {
  const AddProjectButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        AddProjectDialog.show(context);
      },
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          color: bluePrimaryColor,
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        child: Icon(
          Icons.add,
          size: 25,
          color: Colors.white,
        ),
      ),
    );
  }
}
