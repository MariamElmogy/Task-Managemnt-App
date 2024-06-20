import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:task_manager_app/core/utils/service_locator.dart';
import 'package:task_manager_app/features/home/data/models/task_model.dart';
import 'package:task_manager_app/features/home/data/repo/task_repo_implement.dart';
import 'package:task_manager_app/features/home/presentation/manager/edit_task_cubit/edit_task_cubit.dart';
import 'package:task_manager_app/features/home/presentation/views/widgets/edit_task_view_body.dart';

class EditTaskView extends StatelessWidget {
  const EditTaskView({super.key, required this.data});
  final TaskModel data;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditTaskCubit(getIt.get<TaskRepoImplement>()),
      child: Scaffold(
        body: SafeArea(
          child: BlocConsumer<EditTaskCubit, EditTaskState>(
            listener: (context, state) {
              if (state is EditTaskFailure) {
                log('error message state ${state.errMessage}');
              } else if (state is EditTaskSuccess) {
                log('success');
                GoRouter.of(context).pop();
              }
            },
            builder: (context, state) {
              return EditViewBody(data: data);
            },
          ),
        ),
      ),
    );
  }
}
