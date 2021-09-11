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
        create: (_) => ShowCommentModel(),
        child: Body(),
      ),
    );
  }
}

class ShowCommentModel with ChangeNotifier {
  bool _show = false;

  bool get show => _show;

  showComment() {
    _show = true;
    notifyListeners();
  }
}
