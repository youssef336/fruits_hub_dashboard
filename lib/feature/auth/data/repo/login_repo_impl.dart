import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dashboard/core/errors/failures.dart';
import 'package:fruits_hub_dashboard/core/services/auth_service.dart';
import 'package:fruits_hub_dashboard/feature/auth/domain/repo/login_repo.dart';

import '../../../../core/services/app_user.dart';

class LoginRepoImpl implements LoginRepo {
  final AuthService _supadaseAuth;

  LoginRepoImpl(this._supadaseAuth);
  @override
  Future<Either<Failure, AppUser>> login(String email, String password) async {
    try {
      var result = await _supadaseAuth.signIn(email, password);
      return right(result);
    } on Exception catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
