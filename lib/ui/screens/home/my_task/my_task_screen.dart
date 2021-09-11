import 'package:aking_to_do_list/ui/components/header/my_tab.dart';
import 'package:aking_to_do_list/ui/components/footer/custom_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../others/constant.dart';
import 'components/body.dart';
import 'components/filter_task.dart';

class MyTaskScreen extends StatelessWidget {
  static String routeName = "/my_task";
  const MyTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: redPrimaryColor,
        title: Text("Work List"),
        centerTitle: true,
        actions: [
          FilterTask(),
        ],
      ),
      body: ChangeNotifierProvider(
        create: (_) => MyTab(),
        child: Body(),
      ),
      bottomNavigationBar: CustomBottomBar(currentPage: 0),
    );
  }
}

