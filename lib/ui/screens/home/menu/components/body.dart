import 'package:flutter/material.dart';

import 'add_project_button.dart';
import 'project_list.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProjectList(),
            SizedBox(
              height: 24,
            ),
            AddProjectButton()
          ],
        ),
      ),
    );
  }
}
