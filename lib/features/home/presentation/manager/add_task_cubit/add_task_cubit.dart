import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:task_manager_app/features/home/data/models/task_model.dart';
import 'package:task_manager_app/features/home/data/repo/task_repo.dart';
part 'add_task_state.dart';

class AddTaskCubit extends Cubit<AddTaskState> {
  AddTaskCubit(this.repo) : super(AddTaskInitial());
  final TaskRepo repo;
  Future<void> addTask(TaskModel task) async {
    emit(AddTaskLoading());
    var result = await repo.addTask(task);
    result.fold((failure) {
      emit(AddTaskFailure(errMessage: failure.errMessage));
    }, (data) {
      emit(AddTaskSuccess());
    });
  }
}
