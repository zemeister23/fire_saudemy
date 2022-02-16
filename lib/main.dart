import 'package:courseapp/core/components/theme_comp.dart';
import 'package:courseapp/routes/my_route.dart';
import 'package:courseapp/service/firebase_user.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await dotenv.load(fileName: ".env");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final MyRoute _myRoute = MyRoute();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Saudemy',
      theme: ThemeComp.themeData,
      onGenerateRoute: _myRoute.onGenerateRoute,
      initialRoute: AuthUser.authUser.currentUser != null ? '/' : '/signin',
    );
  }
}
