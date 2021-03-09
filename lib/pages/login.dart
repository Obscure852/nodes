import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:nodes/pages/home.dart';
import 'package:nodes/pages/register.dart';
import 'package:nodes/widgets/Button.dart';
import 'package:nodes/widgets/TextField.dart';

class Login extends StatefulWidget {
  static String id = "login_screen";
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var emailErrorText ="";
  var passwordErrorText ="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(15),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 300,
                width: MediaQuery.of(context).size.width,
              ),
              TextInputField(
                hintText: "Email Address ...",
                actionType: TextInputAction.next,
                inputType: TextInputType.emailAddress,
                errorText: emailErrorText,
                icon: IconButton(
                  icon: Icon(Icons.email,color: Colors.black,),
                  onPressed: (){},
                ),
              ),
              TextInputField(
                hintText: "Password ...",
                actionType: TextInputAction.done,
                inputType: TextInputType.text,
                errorText: passwordErrorText,
                obscureText: true,
                icon: IconButton(
                  icon: Icon(Icons.lock,color: Colors.black,),
                  onPressed: (){},
                ),
              ),
              Button(
                labelText: "Sign In",
                buttonColor: Colors.orange,
                pressed: (){
                  Navigator.pushNamed(context, Home.id);
                },
              ),
              SizedBox(
                height: 15.0,
              ),
              Center(
                child: RichText(text: TextSpan(
                  text: 'Create an account.',
                  style: TextStyle(fontSize: 14,color: Colors.black),
                  children: [
                    // I should remember that this takes plain text.
                    TextSpan(text: 'Sign Up',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.black, ),
                    recognizer: TapGestureRecognizer()..onTap = () => Navigator.pushNamed(context, Register.id)),
                  ]
                )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
