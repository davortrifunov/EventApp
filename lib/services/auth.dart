import 'package:EventApp/Database/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthSerivce {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  UserModel _userFromFirebaseUser(User user) {
    return user != null ? UserModel(uid: user.uid) : null;
  }

  Stream<UserModel> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  //sign in with email & password

  Future signInWithEmailAndPassword(String email, String pass) async {
    try {
      UserCredential result =
          await _auth.signInWithEmailAndPassword(email: email, password: pass);
      User us = result.user;
      return _userFromFirebaseUser(us);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //register with email & password
  Future registerWithEmailAndPassword(String email, String pass) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: pass);
      User us = result.user;
      return _userFromFirebaseUser(us);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
