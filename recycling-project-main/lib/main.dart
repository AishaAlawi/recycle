import 'package:flutter/material.dart';
import 'package:tsetrun/home_screen.dart';
import 'package:tsetrun/login_page.dart';
import 'package:tsetrun/map_screen.dart';
import 'package:tsetrun/sign_up_page.dart';
import 'package:tsetrun/recy_screen.dart';

void main() {
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
      home: RecyScreen(),
    );
  }
}
