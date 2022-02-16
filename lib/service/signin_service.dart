import 'package:courseapp/service/firebase_user.dart';

class SignInService {
  static Future signIn(String email, String password) async {
    try {
      await AuthUser.authUser.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return true;
    } catch (e) {
      print("SIGN IN ERROR: $e");
      return false;
    }
  }
}
