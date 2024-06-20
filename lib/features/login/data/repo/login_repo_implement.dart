import 'package:dartz/dartz.dart';
import 'package:task_manager_app/core/errors/failure.dart';
import 'package:task_manager_app/core/utils/api_links.dart';
import 'package:task_manager_app/core/utils/shared_pref_singleton.dart';
import 'package:task_manager_app/features/login/data/models/user_model.dart';
import 'package:task_manager_app/features/login/data/repo/login_repo.dart';
import 'package:task_manager_app/service/api_service.dart';

class LoginRepoImplement implements LoginRepo {
  @override
  Future<Either<Failure, String>> login(UserModel userModel) async {
    try {
      var data = await ApiService().postRequest(
        url: ApiLinks.loginUrl,
        data: userModel.toJson(),
      );
      SharedPrefSingleton().setToken(data['token']);
      SharedPrefSingleton().setUserId(data['id']);
      SharedPrefSingleton().setUsername(data['firstName']);
      return right(data['token']);
    } catch (e) {
      return left(ServerFailure("fail in login $e"));
    }
  }
}
