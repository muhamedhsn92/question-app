import 'package:flutter/material.dart';
import 'package:question_app/shared/components/components.dart';
import 'package:question_app/shared/components/constants.dart';

class NewTasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) => buildTaskItem(),
        separatorBuilder: (context, index) => Container(
              width: double.infinity,
              height: 1.0,
              color: Colors.grey[200],
            ),
        itemCount: tasks.length);
  }
}
