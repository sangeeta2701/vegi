import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_app/models/product_model.dart';

class ProductProvider with ChangeNotifier {
  List<ProductModel> herbsProductList = [];
  List<ProductModel> fruitProductList = [];
  List<ProductModel> rootProductList = [];

  late ProductModel productModel;

  List<ProductModel> search = [];
  productModels(QueryDocumentSnapshot element) {
    productModel = ProductModel(
        productName:element.data().toString().contains('productName')? element.get("productName"):"",
        productImage:element.data().toString().contains('productImage')?  element.get("productImage"):"",
        productrice:element.data().toString().contains('productPrice')? element.get("productPrice"):0,
        productId:element.data().toString().contains('productId')?element.get("productId"):"",
    productQuantity:element.data().toString().contains('productQuantity')? element.get("productQuantity"):0
    );
    
    search.add(productModel);
  }

////////////herbs product/////////////////////////
  fetchHerbsProductData() async {
    List<ProductModel> newList = [];
    QuerySnapshot value =
        await FirebaseFirestore.instance.collection("HerbsProduct").get();
    // ignore: avoid_function_literals_in_foreach_calls
    value.docs.forEach((element) {
      productModels(element);
      // print(element.data());
      // productModel = ProductModel(
      // productName: element.get("productName"),
      // productImage: element.get("productImage"),
      // productrice: element.get("productPrice"));
      newList.add(productModel);
    });
    herbsProductList = newList;
    notifyListeners();
  }

  List<ProductModel> get getHerbsProductDataList {
    return herbsProductList;
  }

  ////////////////Fruits Product ///////////////////////////////////

  fetchFruitProductData() async {
    List<ProductModel> newFruitList = [];
    QuerySnapshot value =
        await FirebaseFirestore.instance.collection("FruitsProducts").get();
    // ignore: avoid_function_literals_in_foreach_calls
    value.docs.forEach((element) {
      productModels(element);
      // print(element.data());
      // productModel = ProductModel(
      //     productName: element.get("productName"),
      //     productImage: element.get("productImage"),
      //     productrice: element.get("productPrice"));
      newFruitList.add(productModel);
    });
    fruitProductList = newFruitList;
    notifyListeners();
  }

  List<ProductModel> get getFruitsProductDataList {
    return fruitProductList;
  }

//////////////////////root product/////////////////////////////
  fetchRootProductData() async {
    List<ProductModel> newRootList = [];
    QuerySnapshot value =
        await FirebaseFirestore.instance.collection("RootProducts").get();
    // ignore: avoid_function_literals_in_foreach_calls
    value.docs.forEach((element) {
      productModels(element);
      // print(element.data());
      // productModel = ProductModel(
      //     productName: element.get("productName"),
      //     productImage: element.get("productImage"),
      //     productrice: element.get("productPrice"));
      newRootList.add(productModel);
    });
    rootProductList = newRootList;
    notifyListeners();
  }

  List<ProductModel> get getRootProductDataList {
    return rootProductList;
  }

  ///////////////////////// Search /////////////////////////////
  List<ProductModel> get getAllProductSearch {
    return search;
  }
}
