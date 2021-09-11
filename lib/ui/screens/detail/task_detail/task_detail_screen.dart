import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/body.dart';

class TaskDetailScreen extends StatelessWidget {
  static String routeName = "/task_detail";
  const TaskDetailScreen({Key? key, required}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (_) => Comment(),
        child: Body(),
      ),
    );
  }
}

class Comment with ChangeNotifier {
  bool? _show;

  show() {
    _show = true;
    notifyListeners();
  }
}
