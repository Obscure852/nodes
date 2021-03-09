import 'package:flutter/material.dart';
import 'package:nodes/pages/home.dart';
import 'package:nodes/pages/login.dart';
import 'package:nodes/pages/register.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Login(),
      routes: {
        Login.id : (context) => Login(),
        Register.id : (context) => Register(),
        Home.id : (context) => Home(),
      },
    );
  }
}
