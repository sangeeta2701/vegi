import 'package:flutter/material.dart';
import 'package:food_app/utils/colors.dart';
import 'package:food_app/widgets/sizedBox.dart';

class ProductOverviewScreen extends StatefulWidget {
  const ProductOverviewScreen({super.key});

  @override
  State<ProductOverviewScreen> createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: bColor),
        title: Text(
          "Product Overview",
          style: TextStyle(color: bColor),
        ),
      ),
      bottomNavigationBar: Row(children: [
        bottomNavigationBar(gColor, bColor, wColor, "Add To Wishlist", Icons.favorite_border),
        bottomNavigationBar(wColor, themeColor, bColor, "Go To Cart", Icons.shopping_cart_outlined)

      ]),
    );
  }

  Widget bottomNavigationBar(Color iconColor, Color backgriundColor, Color color,
      String title, IconData icon) {
    return Expanded(child: Container(
      padding: EdgeInsets.all(20),
      color: backgriundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon,size: 17,color: iconColor,),
          width4,
          Text(title,style: TextStyle(color: color),)
        ],),
    ),);
  }
}
