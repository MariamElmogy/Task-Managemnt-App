import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:task_manager_app/core/utils/app_colors.dart';
import 'package:task_manager_app/core/utils/shared_pref_singleton.dart';
import 'package:task_manager_app/core/utils/styles.dart';
import 'package:task_manager_app/core/widgets/custom_button.dart';
import 'package:task_manager_app/core/widgets/custom_exit_app_bar.dart';
import 'package:task_manager_app/core/widgets/custom_text_form_field.dart';
import 'package:task_manager_app/features/home/data/models/task_model.dart';
import 'package:task_manager_app/features/home/presentation/manager/edit_task_cubit/edit_task_cubit.dart';

class EditViewBody extends StatefulWidget {
  const EditViewBody({
    super.key,
    required this.data,
  });
  final TaskModel data;

  @override
  State<EditViewBody> createState() => _EditViewBodyState();
}

class _EditViewBodyState extends State<EditViewBody> {
  late TextEditingController todoController;
  late bool isDone;

  @override
  void initState() {
    super.initState();
    todoController = TextEditingController(text: widget.data.todo);
    isDone = widget.data.completed;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          CustomExitAppBar(onTap: () => GoRouter.of(context).pop()),
          Text(
            'Edit Task',
            style: Styles.fontSizeBold30,
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      isDone = !widget.data.completed;
                    });
                  },
                  icon: isDone
                      ? const Icon(Icons.done)
                      : const Icon(Icons.radio_button_unchecked),
                  color: const Color.fromARGB(255, 172, 173, 249),
                ),
              ),
              Expanded(
                flex: 10,
                child: CustomTextFormField(
                  hintText: widget.data.todo,
                  controller: todoController,
                ),
              ),
            ],
          ),
          const Spacer(),
          CustomButton(
            title: 'Edit',
            color: AppColors.purplePlum,
            onTap: () async {
              var taskModel = TaskModel(
                id: widget.data.id,
                todo: todoController.text,
                completed: isDone,
                userId: SharedPrefSingleton().userId,
              );
              log('taskModel.todo ${taskModel.todo}');
              log('taskModel.completed ${taskModel.completed}');
              log('taskModel.userId ${taskModel.userId}');
              log('taskModel.id ${taskModel.id}');
              await BlocProvider.of<EditTaskCubit>(context).editTask(taskModel);
            },
          ),
        ],
      ),
    );
  }
}
