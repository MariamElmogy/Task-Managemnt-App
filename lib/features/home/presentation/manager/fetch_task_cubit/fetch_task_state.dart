part of 'fetch_task_cubit.dart';

@immutable
sealed class FetchTaskState {}

final class FetchTaskInitial extends FetchTaskState {}

final class FetchTaskLoading extends FetchTaskState {}

final class FetchTaskSuccess extends FetchTaskState {
  final List<TaskModel> modelList;
  FetchTaskSuccess(this.modelList, );
}

final class FetchTaskFailure extends FetchTaskState {
  final String errMessage;
  FetchTaskFailure({required this.errMessage});
}
