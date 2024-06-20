import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:task_manager_app/features/home/data/models/task_model.dart';
import 'package:task_manager_app/features/home/data/repo/task_repo.dart';

part 'edit_task_state.dart';

class EditTaskCubit extends Cubit<EditTaskState> {
  EditTaskCubit(this.repo) : super(EditTaskInitial());
  final TaskRepo repo;
  Future<void> editTask(TaskModel task) async {
    emit(EditTaskLoading());
    var result = await repo.editTask(task);
    result.fold((failure) {
      emit(EditTaskFailure(errMessage: failure.errMessage));
    }, (data) {
      emit(EditTaskSuccess());
    });
  }
}
