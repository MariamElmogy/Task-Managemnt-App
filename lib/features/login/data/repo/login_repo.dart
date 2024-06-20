import 'package:dartz/dartz.dart';
import 'package:task_manager_app/core/errors/failure.dart';
import 'package:task_manager_app/features/login/data/models/user_model.dart';

abstract class LoginRepo {
  Future<Either<Failure, String>> login(UserModel userModel);
}
