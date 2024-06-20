import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:task_manager_app/features/home/data/models/task_model.dart';
import 'package:task_manager_app/features/home/data/repo/task_repo.dart';
part 'delete_task_state.dart';

class DeleteTaskCubit extends Cubit<DeleteTaskState> {
  DeleteTaskCubit(this.repo) : super(DeleteTaskInitial());

  final TaskRepo repo;

  Future<void> deleteTask(TaskModel taskModel) async {
    emit(DeleteTaskLoading());
    var result = await repo.deleteTask(taskModel);
    result.fold((failure) {
      emit(DeleteTaskFailure(errMessage: failure.errMessage));
    }, (data) {
      emit(DeleteTaskSuccess());
    });
  }
}
