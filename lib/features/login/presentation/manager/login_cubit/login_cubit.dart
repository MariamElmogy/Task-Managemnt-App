import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:task_manager_app/core/utils/shared_pref_singleton.dart';
import 'package:task_manager_app/features/login/data/models/user_model.dart';
import 'package:task_manager_app/features/login/data/repo/login_repo.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.repo) : super(LoginInitial());
  final LoginRepo repo;

  Future<void> login({required UserModel userModel}) async {
    emit(LoginLoading());
    var result = await repo.login(userModel);
    result.fold((failure) {
      emit(LoginFailure(errMessage: failure.errMessage));
    }, (data) {
      SharedPrefSingleton().setIsLogged(true);
      emit(LoginSuccess(data));
    });
  }
}
