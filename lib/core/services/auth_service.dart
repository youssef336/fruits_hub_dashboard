import 'package:supabase_flutter/supabase_flutter.dart';

abstract class AuthService {
  Future<User> login(String email, String password);
}
