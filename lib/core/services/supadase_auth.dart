import 'package:fruits_hub_dashboard/core/services/app_user.dart';
import 'package:fruits_hub_dashboard/core/services/mains/auth_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupadaseAuth implements AuthService {
  final SupabaseClient _supabase = Supabase.instance.client;
  @override
  Future<AppUser> signIn(String email, String password) async {
    var result = await _supabase.auth.signInWithPassword(
      email: email,
      password: password,
    );
    return AppUser(id: result.user!.id, email: result.user!.email!);
  }
}
