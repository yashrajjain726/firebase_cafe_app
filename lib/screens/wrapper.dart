import 'package:firebase_cafe_app/models/user.dart';
import 'package:firebase_cafe_app/screens/authenticate/authenticate.dart';
import 'package:firebase_cafe_app/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    if (user == null) {
      // Return either home or Authenticate Widget
      return Authenticate();
    } else {
      return Home();
    }
  }
}
