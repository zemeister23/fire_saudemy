import 'package:courseapp/screens/home/home_page.dart';
import 'package:courseapp/screens/sign_in_up/password_reset.dart';
import 'package:courseapp/screens/sign_in_up/sign_in.dart';
import 'package:courseapp/screens/sign_in_up/sign_up.dart';
import 'package:flutter/material.dart';

class MyRoute {
  Route? onGenerateRoute(RouteSettings s) {
    var args = s.arguments;

    switch (s.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomePage());
      case '/signin':
        return MaterialPageRoute(builder: (_) => SignIn());
      case '/signup':
        return MaterialPageRoute(builder: (_) => SignUp());
      case '/passwordReset':
        return MaterialPageRoute(builder: (_) => PasswordReset());
    }
  }
}
