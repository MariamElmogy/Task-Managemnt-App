import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task_manager_app/core/utils/route_paths.dart';
import 'package:task_manager_app/features/home/data/models/task_model.dart';
import 'package:task_manager_app/features/home/presentation/views/edit_task_view.dart';
import 'package:task_manager_app/features/home/presentation/views/home_view.dart';
import 'package:task_manager_app/features/login/presentation/views/login_view.dart';

abstract class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: RoutePaths.kLoginView,
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: RoutePaths.kHomeView,
        builder: (BuildContext context, GoRouterState state) =>
            const HomeView(),
      ),
      GoRoute(
        path: RoutePaths.kEditView,
        builder: (BuildContext context, GoRouterState state) {
          final data = state.extra as TaskModel;
          return EditTaskView(data: data);
        },
      ),
    ],
  );
}
