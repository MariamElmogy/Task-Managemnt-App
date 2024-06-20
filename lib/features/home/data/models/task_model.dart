import 'package:hive/hive.dart';
import 'package:task_manager_app/core/utils/shared_pref_singleton.dart';
part 'task_model.g.dart';

@HiveType(typeId: 0)
class TaskModel {
  @HiveField(0)
  int? id;
  @HiveField(1)
  final String todo;
  @HiveField(2)
  final bool completed;
  @HiveField(3)
  final int userId;

  TaskModel({
    this.id,
    required this.todo,
    required this.completed,
    required this.userId,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json['id'],
      todo: json['todo'],
      completed: json['completed'],
      userId: json['userId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'todo': todo,
      'completed': completed,
      'userId': SharedPrefSingleton().userId,
    };
  }
}
