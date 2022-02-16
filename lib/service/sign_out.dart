import 'package:courseapp/service/firebase_user.dart';

class SignOutService {
  static Future signOut() async {
    try {
      await AuthUser.authUser.signOut();
      return true;
    } catch (e) {
      print("SIGN OUT ERROR: $e");
      return false;
    }
  }
}
