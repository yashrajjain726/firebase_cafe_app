import 'package:firebase_cafe_app/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown[200],
        elevation: 0.0,
        title: Text("Sign In"),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: RaisedButton(
            onPressed: () async {
              dynamic result = await _authService.signInAnonymously();
              if (result == null) {
                print('Error Sign In Anonymously');
              } else {
                print('Sign In Anonymously Successfully');
                print(result.uid);
              }
            },
            child: Text('Incognito Mode')),
      ),
    );
  }
}
