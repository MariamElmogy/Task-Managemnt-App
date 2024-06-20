import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';
import 'package:task_manager_app/core/errors/failure.dart';
import 'package:task_manager_app/core/utils/api_links.dart';
import 'package:task_manager_app/core/utils/constansts.dart';
import 'package:task_manager_app/core/utils/shared_pref_singleton.dart';
import 'package:task_manager_app/features/home/data/models/task_model.dart';
import 'package:task_manager_app/features/home/data/repo/task_repo.dart';
import 'package:task_manager_app/service/api_service.dart';

class TaskRepoImplement implements TaskRepo {
  @override
  Future<Either<Failure, List<TaskModel>>> fetchTasks() async {
    try {
      var data = await ApiService().getRequest(url: ApiLinks.todoUrl);
      List<TaskModel> tasks = [];
      var tasksBox = Hive.box<TaskModel>(kTasksBox);

      for (var items in data['todos']) {
        tasks.add(TaskModel.fromJson(items));
        tasksBox.add(TaskModel.fromJson(items));
      }
      return right(tasksBox.values.toList());
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, TaskModel>> addTask(TaskModel taskModel) async {
    try {
      var data = await ApiService().postRequest(
        url: ApiLinks.addTodoUrl,
        data: taskModel.toJson(),
        authorizationHeader: SharedPrefSingleton().token,
      );
      var tasksBox = Hive.box<TaskModel>(kTasksBox);
      await tasksBox.add(taskModel);

      return right(TaskModel.fromJson(data));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, TaskModel>> editTask(TaskModel taskModel) async {
    try {
      var data = await ApiService().putRequest(
        url: "${ApiLinks.editTaskUrl}/${taskModel.id}",
        data: taskModel.toJson(),
        authorizationHeader: SharedPrefSingleton().token,
      );
      TaskModel updatedTask = TaskModel.fromJson(data);
      var tasksBox = Hive.box<TaskModel>(kTasksBox);
      tasksBox.put(updatedTask.id, updatedTask);
      return right(TaskModel.fromJson(data));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<TaskModel>>> deleteTask(
      TaskModel taskModel) async {
    try {
      await ApiService().deleteRequest(
        url: "${ApiLinks.deleteTaskUrl}/${taskModel.id}",
        data: taskModel.toJson(),
        authorizationHeader: SharedPrefSingleton().token,
      );

      var tasksBox = Hive.box<TaskModel>(kTasksBox);
      tasksBox.delete(taskModel);
      return right(tasksBox.values.toList());
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
