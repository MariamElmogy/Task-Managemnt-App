import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager_app/core/utils/shared_pref_singleton.dart';
import 'package:task_manager_app/core/utils/styles.dart';
import 'package:task_manager_app/core/widgets/custom_button.dart';
import 'package:task_manager_app/core/widgets/custom_text_form_field.dart';
import 'package:task_manager_app/features/home/data/models/task_model.dart';
import 'package:task_manager_app/features/home/presentation/manager/add_task_cubit/add_task_cubit.dart';
import 'package:task_manager_app/features/home/presentation/views/widgets/form_subtitles.dart';

class AddTaskForm extends StatefulWidget {
  const AddTaskForm({super.key});

  @override
  State<AddTaskForm> createState() => _AddTaskFormState();
}

class _AddTaskFormState extends State<AddTaskForm> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  TextEditingController taskNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              'Add Task',
              style: Styles.fontSizeBold30,
            ),
          ),
          const SizedBox(height: 20),
          const FormSubTitles(title: 'Task Name'),
          const SizedBox(height: 10),
          CustomTextFormField(
            hintText: 'Write your notes...',
            controller: taskNameController,
          ),
          const SizedBox(height: 20),
          CustomButton(
            title: 'Save',
            color: const Color(0xFFA0A2F9),
            onTap: () async {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                var taskModel = TaskModel(
                  todo: taskNameController.text,
                  completed: false,
                  userId: SharedPrefSingleton().userId,
                );
                await BlocProvider.of<AddTaskCubit>(context).addTask(taskModel);
              } else {
                setState(() {
                  autovalidateMode = AutovalidateMode.always;
                });
              }
            },
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
