import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ReviewCartProvider with ChangeNotifier {
  void addReviewCartData(String cartId, String cartName, String cartImage,
      int cartPrice, int cartQuantity) async {
    FirebaseFirestore.instance
        .collection("ReviewCart")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("YourReviewCart").doc(cartId).set({
          "cartId":cartId,
          "cartName":cartName,
          "cartImage":cartImage,
          "cartPrice":cartPrice,
          "cartQuantity":cartQuantity,
        },);
  }
}
