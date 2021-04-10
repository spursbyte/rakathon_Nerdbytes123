import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'AuthServices.dart';

class FirebaseOperation with ChangeNotifier {

  String initUserEmail, initUserName, initUserImage;
  String get getInitUserName => initUserName;
  String get getInitUserEmail => initUserEmail;
  String get getInitUserImage => initUserImage;

  Future createUserCollection(BuildContext context, dynamic data) async {
    return FirebaseFirestore.instance
        .collection("Users")
        .doc(Provider.of<Authentication>(context, listen: false).getUserUid)
        .set(data);
  }

  Future uploadPostData(String postId, dynamic data) async {
    return FirebaseFirestore.instance.collection('posts').doc(postId).set(data);
  }

}