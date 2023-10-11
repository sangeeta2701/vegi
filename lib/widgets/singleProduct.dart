import 'package:flutter/material.dart';
import 'package:food_app/widgets/counts.dart';
import 'package:food_app/widgets/sizedBox.dart';

import '../utils/colors.dart';

class SingleProductContainer extends StatelessWidget {
  const SingleProductContainer({super.key,required this.productImage,required this.productName,required this.productId,required this.productPrice,required this.ontap});
  final String productImage;
  final String productName;
  final String productId;
  final int productPrice;
  final VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      height: 230,
      width: 150,
      decoration: BoxDecoration(
        color: wColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: ontap,
              child: Center(
                  child: Image.network(
                productImage,
                height: 120,
              )),
            ),
            Text(
              productName,
              style: TextStyle(
                  fontSize: 16, color: bColor, fontWeight: FontWeight.w500),
            ),
            height4,
            Text(
              "$productPrice\$ /50 Gram",
              style: TextStyle(
                  fontSize: 14, color: gColor, fontWeight: FontWeight.w400),
            ),
            height8,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: 4),
                    // color: gColor,
                    height: 30,
                    width: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border:
                          Border.all(color: gColor.withOpacity(0.3), width: 1),
                    ),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: Text("50 Gram",
                                style: TextStyle(
                                  fontSize: 10,
                                  color: bColor,
                                ))),
                        Center(
                            child: Icon(
                          Icons.arrow_drop_down,
                          color: themeColor,
                        ))
                      ],
                    ),
                  ),
                ),
                width4,
                Expanded(
                  child: Counts(
                      productName: productName,
                      productImage: productImage,
                      productId: productId,
                      // productQuantity: "1",
                      productPrice: productPrice),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
