import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dashboard/core/errors/failures.dart';
import 'package:fruits_hub_dashboard/core/services/app_user.dart';

abstract class LoginRepo {
  Future<Either<Failure, AppUser>> login(String email, String password);
}
