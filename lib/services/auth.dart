import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:firebase_cafe_app/models/user.dart';

class AuthService {
  final auth.FirebaseAuth _auth = auth.FirebaseAuth.instance;

  //create user object based on User
  User _userFromFirebaseUser(auth.User user) {
    return user != null ? User(uid: user.uid) : null;
  }

  //sign in Anonymously
  Future signInAnonymously() async {
    try {
      auth.UserCredential result = await _auth.signInAnonymously();
      auth.User user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //signin using email and password

  //Register to email and password

  //signout
}
