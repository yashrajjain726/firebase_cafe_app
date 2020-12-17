import 'package:firebase_cafe_app/services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final AuthService _auth = new AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cafe App"),
        elevation: .0,
        actions: [
          FlatButton.icon(
            icon: Icon(Icons.exit_to_app),
            label: Text("Log Out"),
            onPressed: () async {
              await _auth.signOut();
            },
          ),
        ],
      ),
    );
  }
}
