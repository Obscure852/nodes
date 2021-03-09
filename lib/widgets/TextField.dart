import 'package:flutter/material.dart';

class TextInputField extends StatelessWidget {

  final String hintText;
  final String labelText;
  final IconButton icon;
  final bool obscureText;
  final TextInputAction actionType;
  final TextEditingController textEditingController;
  final TextInputType inputType;
  final String errorText;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        suffixIcon: icon,
        hintText: hintText,
        contentPadding: EdgeInsets.all(10),
        labelText: labelText,
        errorText: errorText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          borderSide: BorderSide(color: Colors.grey)
        )

      ),
      obscureText: obscureText,
      textInputAction: actionType,
      keyboardType:inputType,
      textAlign: TextAlign.start,
      controller: textEditingController,
      maxLines: maxLines,
    );
  }

  TextInputField({@required this.hintText, this.labelText, this.icon, this.obscureText = false,
      @required this.actionType, this.textEditingController,@required this.inputType,this.maxLines = 1,
  this.errorText});

}
