import 'package:firebase_cafe_app/services/auth.dart';
import 'package:firebase_cafe_app/shared/constants.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _authService = AuthService();
  final _formKey = GlobalKey<FormState>();

//text field state
  String email = '';
  String password = '';
  String error = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown[200],
        elevation: 0.0,
        title: Text("Sign In"),
        centerTitle: true,
        actions: [
          FlatButton.icon(
            label: Text("Register"),
            icon: Icon(
              Icons.person,
            ),
            onPressed: () {
              widget.toggleView();
            },
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                decoration: textInputDecoration.copyWith(
                    hintText: "Enter Email Address",
                    labelText: "Email Address"),
                validator: (value) => value.isEmpty ? 'Enter an Email' : null,
                onChanged: (value) {
                  setState(() {
                    email = value;
                  });
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                decoration: textInputDecoration.copyWith(
                    hintText: "Enter an Password", labelText: "Password"),
                validator: (value) => value.length < 6
                    ? 'Enter an Password of more than 6 Characters'
                    : null,
                obscureText: true,
                onChanged: (value) {
                  setState(() {
                    password = value;
                  });
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              RaisedButton(
                color: Colors.pink,
                child: Text('Sign In', style: TextStyle(color: Colors.white)),
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    dynamic result =
                        await _authService.signInWithEmailPass(email, password);
                    if (result == null) {
                      setState(() {
                        error = "SIGN IN CREDENTIALS ERROR";
                      });
                    }
                  }
                },
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14),
              )
            ],
          ),
        ),
      ),
    );
  }
}
