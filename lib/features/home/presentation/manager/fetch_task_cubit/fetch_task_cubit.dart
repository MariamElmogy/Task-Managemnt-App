import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:task_manager_app/features/home/data/models/task_model.dart';
import 'package:task_manager_app/features/home/data/repo/task_repo.dart';
part 'fetch_task_state.dart';

class FetchTaskCubit extends Cubit<FetchTaskState> {
  FetchTaskCubit(this.repo) : super(FetchTaskInitial());

  final TaskRepo repo;

  Future<void> fetchTasks() async {
    emit(FetchTaskLoading());
    var result = await repo.fetchTasks();
    result.fold((failure) {
      emit(FetchTaskFailure(errMessage: failure.errMessage));
    }, (data) {
      emit(FetchTaskSuccess(data));
    });
  }
}
