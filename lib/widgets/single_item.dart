import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/utils/colors.dart';
import 'package:food_app/widgets/sizedBox.dart';

class SingleItem extends StatelessWidget {
  const SingleItem(
      {super.key,
      required this.productImage,
      required this.isBool,
      required this.productName,
      required this.productPrice,
      required this.productId,
      required this.productQuantity,required this.ondelete});
  final String productImage;
  final bool isBool;
  final String productName;
  final int productPrice;
  final String productId;
  final int productQuantity;
  final VoidCallback ondelete;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 100,
                  width: 100,
                  child: Image.network(productImage),
                ),
              ),
              width8,
              Expanded(
                child: SizedBox(
                  height: 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Text(
                            productName,
                            style: TextStyle(
                              color: bColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "$productPrice\$/50 Grams",
                            style: TextStyle(
                              color: gColor,
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ],
                      ),
                      height8,
                      isBool == false
                          ? SizedBox(
                              width: 100,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      "50 Grams",
                                      style: TextStyle(
                                          color: gColor,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14),
                                    ),
                                  ),
                                  Center(
                                    child: Icon(
                                      Icons.expand_more,
                                      size: 20,
                                      color: themeColor,
                                    ),
                                  )
                                ],
                              ),
                            )
                          : Text(
                              "50 Grams",
                              style: TextStyle(
                                  color: gColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14),
                            ),
                    ],
                  ),
                ),
              ),
              isBool == false
                  ? Expanded(
                      child: Container(
                        height: 100,
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 32),
                        child: Container(
                          height: 35,
                          width: 50,
                          decoration: BoxDecoration(
                            color: themeColor,
                            // border: Border.all(color: gColor),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Center(
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.add,
                                    size: 20,
                                    color: bColor,
                                  ),
                                  Text(
                                    "ADD",
                                    style: TextStyle(
                                        color: bColor,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14),
                                  ),
                                ]),
                          ),
                        ),
                      ),
                    )
                  : Expanded(
                      child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: ondelete,
                          child: Icon(
                            CupertinoIcons.delete,
                            color: gColor,
                            size: 25,
                          ),
                        ),
                        height4,
                        Container(
                          height: 35,
                          width: 100,
                          decoration: BoxDecoration(
                            color: themeColor,
                            // border: Border.all(color: gColor),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Center(
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Icon(
                                    Icons.remove,
                                    size: 20,
                                    color: bColor,
                                  ),
                                  Text(
                                    "1",
                                    style: TextStyle(
                                        color: bColor,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14),
                                  ),
                                  Icon(
                                    Icons.add,
                                    size: 20,
                                    color: bColor,
                                  ),
                                ]),
                          ),
                        )
                      ],
                    )),
            ],
          ),
          isBool == false ? Container() : Divider(),
        ],
      ),
    );
  }
}
