import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager_app/core/utils/service_locator.dart';
import 'package:task_manager_app/features/home/data/repo/task_repo_implement.dart';
import 'package:task_manager_app/features/home/presentation/manager/delete_task_cubit/delete_task_cubit.dart';
import 'package:task_manager_app/features/home/presentation/manager/fetch_task_cubit/fetch_task_cubit.dart';
import 'package:task_manager_app/features/home/presentation/views/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              FetchTaskCubit(getIt.get<TaskRepoImplement>())..fetchTasks(),
        ),
        BlocProvider(
          create: (context) => DeleteTaskCubit(getIt.get<TaskRepoImplement>()),
        ),
      ],
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<FetchTaskCubit, FetchTaskState>(
            builder: (context, state) {
              if (state is FetchTaskSuccess) {
                return HomeViewBody(data: state.modelList);
              } else if (state is FetchTaskFailure) {
                return Center(
                  child: Text(state.errMessage),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
