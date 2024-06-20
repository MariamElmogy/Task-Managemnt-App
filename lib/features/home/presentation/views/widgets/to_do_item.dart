import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task_manager_app/core/utils/route_paths.dart';
import 'package:task_manager_app/core/utils/styles.dart';
import 'package:task_manager_app/features/home/data/models/task_model.dart';

class ToDoItem extends StatelessWidget {
  const ToDoItem({
    super.key,
    required this.data,
  });

  final TaskModel data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: const Color(0XFFD0D1FF),
      ),
      child: ListTile(
        onTap: () {
          GoRouter.of(context).push(RoutePaths.kEditView, extra: data);
        },
        leading: CircleAvatar(
          radius: 16,
          backgroundColor: Colors.white,
          child: Icon(
            data.completed ? Icons.done : Icons.radio_button_unchecked,
            color: const Color.fromARGB(255, 172, 173, 249),
          ),
        ),
        title: Text(
          data.todo,
          style: Styles.fontSizeBold16,
        ),
      ),
    );
  }
}
