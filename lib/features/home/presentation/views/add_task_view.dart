import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:task_manager_app/features/home/presentation/manager/add_task_cubit/add_task_cubit.dart';
import 'package:task_manager_app/features/home/presentation/views/widgets/add_task_view_body.dart';

class AddTaskBottomSheet extends StatelessWidget {
  const AddTaskBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddTaskCubit, AddTaskState>(
      listener: (context, state) {
        if (state is AddTaskFailure) {
          log('error message state ${state.errMessage}');
        } else if (state is AddTaskSuccess) {
          log('success');
          context.pop();
        }
      },
      builder: (context, state) {
        return AbsorbPointer(
          absorbing: state is AddTaskLoading ? true : false,
          child: Padding(
            padding: EdgeInsets.only(
              left: 16,
              right: 16,
              bottom: MediaQuery.of(context).viewInsets.bottom,
              top: 30,
            ),
            child: const SingleChildScrollView(
              child: AddTaskViewBody(),
            ),
          ),
        );
      },
    );
  }
}
