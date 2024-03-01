import 'package:supabase_flutter/supabase_flutter.dart';

class SupaAuth {
  final supabase = Supabase.instance.client;
  loginParamedic(
    String email,
    String password,
  ) async {
    try {
      final response = await supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );
    } on AuthException catch (e) {
      throw AuthException(e.message);
    }
  }
  signOutParamedic() async {
    try {
      await supabase.auth.signOut();
    } on AuthException catch (e) {
      throw AuthException(e.message);
    }
  }
}
