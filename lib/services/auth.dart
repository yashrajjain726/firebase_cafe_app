import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:firebase_cafe_app/models/user.dart';

class AuthService {
  final auth.FirebaseAuth _auth = auth.FirebaseAuth.instance;

  //create user object based on User
  User _userFromFirebaseUser(auth.User user) {
    return user != null ? User(uid: user.uid) : null;
  }

  // Auth change user stream
  Stream<User> get user {
    return _auth
        .authStateChanges()
        // .map((auth.User user) => _userFromFirebaseUser(user));
        .map(_userFromFirebaseUser); // this is same as previous line
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
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
