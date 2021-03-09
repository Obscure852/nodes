import 'package:flutter/material.dart';
class Home extends StatefulWidget {

  static String id ="home_screen";
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        backgroundColor: Colors.orange,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(

          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 10,
        selectedItemColor: Colors.orange,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Requests"),
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Account"),
        ],
      ),
    );
  }
}
