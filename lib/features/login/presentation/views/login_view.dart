import 'package:flutter/material.dart';
import 'package:task_manager_app/core/utils/service_locator.dart';
import 'package:task_manager_app/features/login/data/repo/login_repo_implement.dart';
import 'package:task_manager_app/features/login/presentation/manager/login_cubit/login_cubit.dart';
import 'package:task_manager_app/features/login/presentation/views/bloc_consumer_login_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(getIt.get<LoginRepoImplement>()),
      child: const Scaffold(
        body: SafeArea(
          child: BlocConsumerLoginView(),
        ),
      ),
    );
  }
}
