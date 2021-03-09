import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:nodes/data/databaseHelper.dart';
import 'package:nodes/models/user.dart';
import 'package:nodes/pages/login.dart';
import 'package:nodes/widgets/Button.dart';
import 'package:nodes/widgets/TextField.dart';

class Register extends StatefulWidget {
  static String id = "register_screen";
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  String usernameErrorText = "";
  String emailErrorText = "";
  String passwordErrorText = "";

  var usernameTextController = TextEditingController();
  var emailTextController = TextEditingController();
  var passwordTextController = TextEditingController();
  
  
  bool validate(String username, String email, String password){
    if(username.isEmpty || username.length < 3){
      setState(() {
        usernameErrorText = "Invalid username.";
      });
      return false;
    }

    if(!email.contains("@") || email.isEmpty){
      setState(() {
        emailErrorText = "Invalid email address.";
      });
      return false;
    }

    if(password.isEmpty || password.length < 5){
      setState(() {
        passwordErrorText = "Invalid password.";
      });
      return false;
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Sign Up"),
        backgroundColor: Colors.orange,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 250,
                width: MediaQuery.of(context).size.width,
              ),
              TextInputField(
                textEditingController: usernameTextController,
                  icon: IconButton(icon: Icon(Icons.person,color: Colors.black,), onPressed: null,),
                  errorText: usernameErrorText,
                  hintText: "Username",
                  actionType: TextInputAction.next,
                  inputType: TextInputType.text
              ),
              SizedBox(
                height: 2.0,
              ),
              TextInputField(
                textEditingController: emailTextController,
                hintText: "Email Address ...",
                actionType: TextInputAction.next,
                inputType: TextInputType.emailAddress,
                errorText: emailErrorText,
                icon: IconButton(
                  icon: Icon(Icons.email,color: Colors.black,),
                  onPressed: (){},
                ),
              ),
              SizedBox(
                height: 2.0,
              ),
              TextInputField(
                textEditingController: passwordTextController,
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
              SizedBox(
                height: 10.0,
              ),
              Button(
                labelText: "Sign Up",
                buttonColor: Colors.orange,
                pressed: () async{
                  if(validate(usernameTextController.text, emailTextController.text, passwordTextController.text)){
                    try{
                      User user = User(username: usernameTextController.text,email: emailTextController.text, password: passwordTextController.text,time: DateTime.now().toIso8601String());
                      int result = await DatabaseHelper.instance.insertUser(user);
                      if(result == 1){
                        print("You are Registered.");
                      }
                    }catch(exception){
                      showDialog(context: context,
                      builder: (context){
                        return AlertDialog(
                          title: Text("Error", style: TextStyle(fontWeight: FontWeight.bold),),
                          content: Text("Error registering: " + exception.toString()),
                        );
                      });
                    }
                  }
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              Center(
                child: RichText(text: TextSpan(
                    text: 'Already have an account.',
                    style: TextStyle(fontSize: 14,color: Colors.black),
                    children: [
                      // I should remember that this takes plain text.
                      TextSpan(text: 'Sign In',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.black),
                      recognizer: TapGestureRecognizer() ..onTap =()=>Navigator.pushNamed(context, Login.id)),
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
