import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class Authentication with ChangeNotifier {

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  String userUid;
  String get getUserUid => userUid;

  Future logIntoAccount (String email, String password) async{
    UserCredential userCredential = await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    User user = userCredential.user;
    userUid = user.uid;
    print(userUid);
    notifyListeners();
  }

  Future createAccount (String email, String name, String password) async{
    UserCredential userCredential = await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    User user = userCredential.user;
    userUid = user.uid;
    print(userUid);
    notifyListeners();
  }

  Future logOutViaEmail () {
    return firebaseAuth.signOut();
  }

}