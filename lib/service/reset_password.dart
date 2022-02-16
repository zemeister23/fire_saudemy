import 'package:courseapp/service/firebase_user.dart';

class ResetPasswordService {
  static Future resetPassword(String email) async {
    try {
      await AuthUser.authUser.sendPasswordResetEmail(email: email);
      return true;
    } catch (e) {
      print("SIGN IN ERROR: $e");
      return false;
    }
  }
}
