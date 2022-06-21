import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tsetrun/screens/home_screen.dart';
import 'package:tsetrun/screens/login_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
// stateless
//stateful

//Class MyApp

class MyApp extends StatelessWidget {
  //constructor
  //build

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: LoginPage(),
    );
  }
}
