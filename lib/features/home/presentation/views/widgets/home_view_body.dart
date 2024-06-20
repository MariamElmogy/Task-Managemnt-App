import 'package:flutter/material.dart';
import 'package:task_manager_app/core/utils/shared_pref_singleton.dart';
import 'package:task_manager_app/core/utils/styles.dart';
import 'package:task_manager_app/features/home/data/models/task_model.dart';
import 'package:task_manager_app/features/home/presentation/views/widgets/add_date_time_container.dart';
import 'package:task_manager_app/features/home/presentation/views/widgets/custom_button_add_task.dart';
import 'package:task_manager_app/features/home/presentation/views/widgets/to_do_list_view.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key, required this.data});
  final List<TaskModel> data;

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  DateTime selectedDate = DateTime.now();
  String name = SharedPrefSingleton().username;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Hi $name!",
            style: Styles.fontSizeBold30,
          ),
          AddDateTimeContainer(
            onDateChange: (date) {
              selectedDate = date;
            },
          ),
          const SizedBox(height: 8),
          const CustomButtonAddTask(),
          const SizedBox(height: 16),
          Expanded(child: ToDoListView(tasks: widget.data)),
        ],
      ),
    );
  }
}
