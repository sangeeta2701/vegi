import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

//for saving google signin data
class UserProvider extends ChangeNotifier {
  void addUserData(User currentUser, String userName,String userEmail,String userImage) async {
    await FirebaseFirestore.instance.collection("usersData").doc(currentUser.uid).set({
      "userName":userName,
      "userEmail":userEmail,
      "userImage":userImage,
      "userId":currentUser.uid,
    });
  }
}
