import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dashboard/core/errors/failures.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class LoginRepo {
  Future<Either<Failure, User>> login(String email, String password);
}
