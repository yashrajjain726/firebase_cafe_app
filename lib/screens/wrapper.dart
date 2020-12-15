import 'package:firebase_cafe_app/screens/authenticate/authenticate.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Return either home or Authenticate Widget
    return Authenticate();
  }
}
