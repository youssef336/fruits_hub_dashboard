import 'package:fruits_hub_dashboard/core/services/auth_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupadaseAuth implements AuthService {
  SupabaseClient _supabase = Supabase.instance.client;
  @override
  Future<User> login(String email, String password) async {
    var result = await _supabase.auth.signInWithPassword(
      email: email,
      password: password,
    );
    return result.user!;
  }
}

bool isUserLoggedIn() {
  return Supabase.instance.client.auth.currentUser != null;
}
