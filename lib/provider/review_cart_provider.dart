import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../models/review_cart_model.dart';

class ReviewCartProvider with ChangeNotifier {
  void addReviewCartData(String cartId, String cartName, String cartImage,
      int cartPrice, int cartQuantity) async {
    // FirebaseFirestore.instance
    //     .collection("ReviewCart")
    //     .doc(FirebaseAuth.instance.currentUser!.uid)
    //     .collection("YourReviewCart")
    //     .doc(cartId)
    //     .set(
    FirebaseFirestore.instance
        .collection("ReviewCart")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("YourReviewCart")
        .doc(cartId)
        .set(
      {
        "cartId": cartId,
        "cartName": cartName,
        "cartImage": cartImage,
        "cartPrice": cartPrice,
        "cartQuantity": cartQuantity,
      },
    );
  }

//   List<ReviewCartModel> reviewCartDataList = [];
//   void getReviewCartData() async {
//     List<ReviewCartModel> newList = [];
//     QuerySnapshot reviewCartValue = await FirebaseFirestore.instance
//         .collection("ReviewCart")
//         .doc(FirebaseAuth.instance.currentUser?.uid)
//         .collection("YourReviewCart")
//         .get();

//     reviewCartValue.docs.forEach((element) {
//       ReviewCartModel reviewCartModel = ReviewCartModel(
//           cartId: element.get("cartId"),
//           cartName: element.get("cartName"),
//           cartImage: element.get("cartImage"),
//           cartPrice: element.get("cartPrice"),
//           cartQuantity: element.get("cartQuantity"));
//       newList.add(reviewCartModel);
//     });
//     reviewCartDataList = newList;
//     notifyListeners();
//   }

//  List<ReviewCartModel> get getReviewCartDataList {
//     return reviewCartDataList;
//   }


 List<ReviewCartModel> reviewCartDataList = [];
  void getReviewCartData() async {
    List<ReviewCartModel> newList = [];

    QuerySnapshot reviewCartValue = await FirebaseFirestore.instance
        .collection("ReviewCart")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("YourReviewCart")
        .get();
    // ignore: avoid_function_literals_in_foreach_calls
    reviewCartValue.docs.forEach((element) {
      ReviewCartModel reviewCartModel = ReviewCartModel(
        cartId: element.get("cartId"),
        cartImage: element.get("cartImage"),
        cartName: element.get("cartName"),
        cartPrice: element.get("cartPrice"),
        cartQuantity: element.get("cartQuantity"),
      // cartUnit: element.get("cartUnit"),
      );
      newList.add(reviewCartModel);
    });
    reviewCartDataList = newList;
    notifyListeners();
  }

  List<ReviewCartModel> get getReviewCartDataList {
    return reviewCartDataList;
  }

}
