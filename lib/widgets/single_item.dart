import 'package:flutter/material.dart';
import 'package:food_app/utils/colors.dart';
import 'package:food_app/widgets/sizedBox.dart';

class SingleItem extends StatelessWidget {
  const SingleItem({super.key,required this.img});
 final String img;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 100,
            width: 100,
            child: Image.asset(img),
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
                      "product Name",
                      style: TextStyle(
                        color: bColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "50\$/50 Grams",
                      style: TextStyle(
                        color: gColor,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
                height8,
                SizedBox(
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
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: 100,
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 32),
            child: Container(
              height: 35,
              width: 50,
              decoration: BoxDecoration(
                color: themeColor,
                // border: Border.all(color: gColor),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Center(
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
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
        ),
      ],
    );
  }
}
