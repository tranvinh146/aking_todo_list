import 'package:aking_to_do_list/ui/components/footer/custom_bottom_bar.dart';
import 'package:flutter/material.dart';

import '../../../../others/constant.dart';
import 'components/body.dart';

class AddQuickNoteScreen extends StatelessWidget {
  static String routeName = "/add_quick_note";
  const AddQuickNoteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Note"),
        centerTitle: true,
        backgroundColor: redPrimaryColor,
      ),
      body: Body(),
      bottomNavigationBar: CustomBottomBar(),
    );
  }
}
