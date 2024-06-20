import 'package:dartz/dartz.dart';
import 'package:task_manager_app/core/errors/failure.dart';
import 'package:task_manager_app/features/home/data/models/task_model.dart';

abstract class TaskRepo {
  Future<Either<Failure, List<TaskModel>>> fetchTasks();
  Future<Either<Failure, TaskModel>> addTask(TaskModel taskModel);
  Future<Either<Failure, TaskModel>> editTask(TaskModel taskModel);
  Future<Either<Failure, List<TaskModel>>> deleteTask(TaskModel taskModel);
}
