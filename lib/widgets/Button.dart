import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  Button({@required this.labelText, @required this.buttonColor,@required this.pressed});
  final String labelText;
  final Color buttonColor;
  final VoidCallback pressed;
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(30),
      color: buttonColor,
      child: MaterialButton(
        onPressed: pressed,
        child: Text(labelText,style: TextStyle(color: Colors.black,fontSize: 16),),
      ),
    );
  }

}
