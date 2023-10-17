

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class WishListProvider with ChangeNotifier{
  void addReviewCartData(String wishListId, String wishListName, String wishListImage,
      int wishListPrice, int wishListQuantity,) async {
    FirebaseFirestore.instance
        .collection("ReviewCart")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("YourReviewCart")
        .doc(wishListId)
        .set(
      {
        "cartId": wishListId,
        "cartName": wishListName,
        "cartImage": wishListImage,
        "cartPrice": wishListPrice,
        "cartQuantity": wishListQuantity,
        "wishList":true
      },
    );
  }
}