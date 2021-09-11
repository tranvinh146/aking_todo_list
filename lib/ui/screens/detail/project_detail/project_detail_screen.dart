import 'package:aking_to_do_list/ui/components/header/my_tab.dart';
import 'package:aking_to_do_list/ui/components/header/project_app_bar.dart';
import 'package:aking_to_do_list/ui/components/footer/custom_bottom_bar.dart';
import 'package:aking_to_do_list/ui/screens/home/my_task/components/body.dart';
import 'package:aking_to_do_list/ui/screens/home/my_task/components/filter_task.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProjectDetailScreen extends StatelessWidget {
  static String routeName = "/project_detail";
  const ProjectDetailScreen({Key? key, required}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ProjectAppBar;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: args.colorAppBar,
        title: Text(args.title!),
        centerTitle: true,
        actions: [
          FilterTask(),
        ],
      ),
      body: ChangeNotifierProvider(
        create: (_) => MyTab(),
        child: Body(
          tabColor: args.colorAppBar,
        ),
      ),
      bottomNavigationBar: CustomBottomBar(currentPage: 2),
    );
  }
}
