import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

abstract class BaseAuth {
  Future<String> signUp(String email, String password);
}

class Auth implements BaseAuth {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<String> signUp(String email, String password) async {
    final FirebaseUser user = (await _auth.createUserWithEmailAndPassword(
        email: email, password: password)).user;
    return user.uid;
  }
}
