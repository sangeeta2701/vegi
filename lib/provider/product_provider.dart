import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_app/models/product_model.dart';

class ProductProvider with ChangeNotifier {
  List<ProductModel> herbsProductList = [];
  late ProductModel productModel;

  fetchHerbsProductData() async {
    List<ProductModel> newList = [];
    QuerySnapshot value =
        await FirebaseFirestore.instance.collection("HerbsProduct").get();
    value.docs.forEach((element) {
      // print(element.data());
      productModel = ProductModel(
          productName: element.get("productName"),
          productImage: element.get("productImage"),
          productrice: element.get("productPrice"));
      newList.add(productModel);
    });
    herbsProductList = newList;
    notifyListeners();
  }

 List<ProductModel> get getHerbsProductDataList {
    return herbsProductList;
  }
}
