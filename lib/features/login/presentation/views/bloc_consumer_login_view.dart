import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:task_manager_app/core/utils/build_snack_bar.dart';
import 'package:task_manager_app/core/utils/route_paths.dart';
import 'package:task_manager_app/features/login/presentation/manager/login_cubit/login_cubit.dart';
import 'package:task_manager_app/features/login/presentation/views/widgets/login_view_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocConsumerLoginView extends StatelessWidget {
  const BlocConsumerLoginView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginFailure) {
          log('exception login ${state.errMessage}');
          buildSnakBar(context, state.errMessage);
        } else if (state is LoginSuccess) {
          GoRouter.of(context).push(RoutePaths.kHomeView);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is LoginLoading ? true : false,
          child: const LoginViewBody(),
        );
      },
    );
  }
}
