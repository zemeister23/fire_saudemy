import 'package:courseapp/service/firebase_user.dart';

class SignUpService {
  static Future signUp(String email, String password) async {
    try {
      await AuthUser.authUser.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return true;
    } catch (e) {
      print("SIGN UP ERROR: $e");
      return false;
    }
  }
}
