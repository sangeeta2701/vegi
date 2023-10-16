import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_app/provider/review_cart_provider.dart';
import 'package:provider/provider.dart';
import '../utils/colors.dart';



class Counts extends StatefulWidget {
  const Counts(
      {super.key,
      required this.productName,
      required this.productImage,
      required this.productId,
      required this.productPrice});
  final String productName;
  final String productImage;
  final String productId;
//  final String productQuantity;
  final int productPrice;

  @override
  State<Counts> createState() => _CountsState();
}

class _CountsState extends State<Counts> {
  int count = 0;
  bool isTrue = false;

  getAddAndQuantity() {
    FirebaseFirestore.instance
        .collection("ReviewCart")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("YourReviewCart")
        .doc(widget.productId)
        .get()
        .then((value) {
      if (mounted) {
        if (value.exists) {
          setState(() {
            count = value.get("cartQuantity");
            isTrue = value.get("isAdd");
          }
              // setState(() {
              //   count = value.get("cartQuantity");
              //   isTrue = value.get("isAdd");
              // }
              );
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    getAddAndQuantity();
    // print(widget.productId);
    ReviewCartProvider reviewCartProvider = Provider.of(context);
    return Container(
      // color: themeColor,
      height: 30,
      width: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: gColor.withOpacity(0.3), width: 1),
      ),
      child: isTrue == true
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    if (count == 1) {
                      setState(() {
                        isTrue = false;
                      });
                      reviewCartProvider.reviewCartDataDelete(widget.productId);
                    }
                    if (count > 1) {
                      setState(() {
                        count--;
                      });
                      reviewCartProvider.updateReviewCartData(
                        widget.productId,
                        widget.productName,
                        widget.productImage,
                        widget.hashCode,
                        count);
                    }
                  },
                  child: Icon(
                    Icons.remove,
                    color: themeColor,
                    size: 15,
                  ),
                ),
                Text("$count"),
                InkWell(
                  onTap: () {
                    setState(() {
                      count++;
                    });
                    reviewCartProvider.updateReviewCartData(
                        widget.productId,
                        widget.productName,
                        widget.productImage,
                        widget.hashCode,
                        count);
                  },
                  child: Icon(
                    Icons.add,
                    color: themeColor,
                    size: 15,
                  ),
                ),
              ],
            )
          : Center(
              child: InkWell(
                onTap: () {
                  setState(() {
                    isTrue = true;
                  });
                  reviewCartProvider.addReviewCartData(
                    widget.productId,
                    widget.productName,
                    widget.productImage,
                    widget.productPrice,
                    count,
                  );
                },
                child: Text(
                  "ADD",
                  style: TextStyle(
                    color: themeColor,
                  ),
                ),
              ),
            ),
    );
  }
}
