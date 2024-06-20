import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task_manager_app/core/widgets/custom_exit_app_bar.dart';
import 'add_task_form.dart';

class AddTaskViewBody extends StatelessWidget {
  const AddTaskViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomExitAppBar(onTap: () => GoRouter.of(context).pop()),
        const AddTaskForm(),
      ],
    );
  }
}
