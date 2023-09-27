import 'package:flutter/material.dart';
import 'package:food_app/widgets/sizedBox.dart';

import '../utils/colors.dart';


 Widget singleProductContainer(String imag, String name, VoidCallback ontap) {
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
                  child: Image.asset(
                imag,
                height: 120,
              )),
            ),
            Text(
              name,
              style: TextStyle(
                  fontSize: 16, color: bColor, fontWeight: FontWeight.w500),
            ),
            height4,
            Text(
              "\$50/50gram",
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
                  child: Container(
                    // color: themeColor,
                    height: 30,
                    width: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border:
                          Border.all(color: gColor.withOpacity(0.3), width: 1),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.remove,
                          color: themeColor,
                          size: 15,
                        ),
                        Text("1"),
                        Icon(
                          Icons.add,
                          color: themeColor,
                          size: 15,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }