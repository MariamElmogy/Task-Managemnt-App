import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager_app/core/utils/app_colors.dart';
import 'package:task_manager_app/core/utils/service_locator.dart';
import 'package:task_manager_app/core/utils/styles.dart';
import 'package:task_manager_app/features/home/data/repo/task_repo_implement.dart';
import 'package:task_manager_app/features/home/presentation/manager/add_task_cubit/add_task_cubit.dart';
import 'package:task_manager_app/features/home/presentation/views/add_task_view.dart';

class CustomButtonAddTask extends StatelessWidget {
  const CustomButtonAddTask({
    super.key,
    this.onTap,
  });
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showModalBottomSheet(
        isScrollControlled: true,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        context: context,
        backgroundColor: AppColors.lilacPetalsDark,
        builder: (context) => BlocProvider(
          create: (context) => AddTaskCubit(getIt.get<TaskRepoImplement>()),
          child: const AddTaskBottomSheet(),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('To-do List', style: Styles.fontSizeBold20),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: const Color(0xFFA0A2F9),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                const SizedBox(width: 5),
                Text(
                  'Add task',
                  style: Styles.fontSizeMedium12.copyWith(color: Colors.white),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
