import 'package:get_it/get_it.dart';
import 'package:task_manager_app/features/home/data/repo/task_repo_implement.dart';
import 'package:task_manager_app/features/login/data/repo/login_repo_implement.dart';

final getIt = GetIt.instance;

void setUpServiceLocator() {
  getIt.registerSingleton<LoginRepoImplement>(
    LoginRepoImplement(),
  );

   getIt.registerSingleton<TaskRepoImplement>(
    TaskRepoImplement(),
  );
}
