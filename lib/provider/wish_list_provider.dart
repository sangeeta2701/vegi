import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_app/models/product_model.dart';

class WishListProvider with ChangeNotifier {
  void addWishListData(
    String wishListId,
    String wishListName,
    String wishListImage,
    int wishListPrice,
    int wishListQuantity,
  ) async {
    FirebaseFirestore.instance
        .collection("Wishlist")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("YourWishlist")
        .doc(wishListId)
        .set(
      {
        "wishListId": wishListId,
        "wishListName": wishListName,
        "wishListImage": wishListImage,
        "wishListPrice": wishListPrice,
        "wishListQuantity": wishListQuantity,
        "wishList": true
      },
    );
  }

  ////////////////////////////get wishlist data///////////////
  List<ProductModel> wishList = [];

  getWishtListData() async {
    List<ProductModel> newList = [];
    QuerySnapshot value = await FirebaseFirestore.instance
        .collection("WishList")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("YourWishList")
        .get();
    value.docs.forEach(
      (element) {
        ProductModel productModel = ProductModel(
          productId: element.get("wishListId"),
          productImage: element.get("wishListImage"),
          productName: element.get("wishListName"),
          productrice: element.get("wishListPrice"),
          productQuantity: element.get("wishListQuantity"),
        );
        newList.add(productModel);
      },
    );
    wishList = newList;
    notifyListeners();
  }

  List<ProductModel> get getWishList {
    return wishList;
  }
  // List<ProductModel> wishList = [];
  // getwishListData() async {
  //   List<ProductModel> newList = [];
  //   QuerySnapshot value = await FirebaseFirestore.instance
  //       .collection("Wishlist")
  //       .doc(FirebaseAuth.instance.currentUser?.uid)
  //       .collection("YourWishlist")
  //       .get();
  //   value.docs.forEach((element) {
  //     ProductModel productModel = ProductModel(
  //       productId: element.get("wishListId"),
  //       productImage: element.get("wishListImage"),
  //       productName: element.get("wishListName"),
  //       productrice: element.get("wishListPrice"),
  //       productQuantity: element.get("wishListQuantity"),
  //     );
  //     // productName:element.data().toString().contains('wishListName') ? element.get("wishListName"):"",
  //     // productImage:element.data().toString().contains('wishListImage') ? element.get("wishListImage"):"",
  //     // productrice:element.data().toString().contains('wishListPrice') ? element.get("wishListPrice"):0,
  //     // productId:element.data().toString().contains('wishListId') ? element.get("wishListId"):"",
  //     // productQuantity:element.data().toString().contains('wishListQuantity')? element.get("wishListQuantity"):0);
  //     newList.add(productModel);
  //   });
  //   wishList = newList;
  //   notifyListeners();
  // }

  // List<ProductModel> get getWishList {
  //   return wishList;
  // }
}
