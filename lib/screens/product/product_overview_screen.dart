import 'package:flutter/material.dart';
import 'package:food_app/utils/colors.dart';
import 'package:food_app/widgets/sizedBox.dart';

enum SigninCharacter { fill, outline }

class ProductOverviewScreen extends StatefulWidget {
  const ProductOverviewScreen({super.key,required this.productName,required this.productImage});
  final String productName;
  final String productImage;

  @override
  State<ProductOverviewScreen> createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  SigninCharacter _character = SigninCharacter.fill;
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
        bottomNavigationBar(
            gColor, bColor, wColor, "Add To Wishlist", Icons.favorite_border),
        bottomNavigationBar(wColor, themeColor, bColor, "Go To Cart",
            Icons.shopping_cart_outlined)
      ]),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  ListTile(
                    title: Text(widget.productName),
                    subtitle: Text("\$50"),
                  ),
                  Container(
                    height: 280,
                    padding: EdgeInsets.all(20),
                    child: Image.asset(widget.productImage,),
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'Available Options',
                      textAlign: TextAlign.start,
                      style:
                          TextStyle(color: bColor, fontWeight: FontWeight.w600),
                    ),
                  ),
                  height4,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 3,
                              backgroundColor: greenColor,
                            ),
                            Radio(
                                activeColor: greenColor,
                                value: SigninCharacter.fill,
                                groupValue: _character,
                                onChanged: (value) {
                                  setState(() {
                                    _character = value!;
                                  });
                                })
                          ],
                        ),
                        Text("\$50"),
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 30),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(color: gColor, width: 1)),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.add,
                                  size: 17,
                                  color: themeColor,
                                ),
                                Text(
                                  "ADD",
                                  style: TextStyle(color: themeColor),
                                )
                              ]),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "About This Product",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: bColor),
                  ),
                  height12,
                  Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: bColor,
                        height: 1.4),
                    textAlign: TextAlign.justify,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget bottomNavigationBar(Color iconColor, Color backgriundColor,
      Color color, String title, IconData icon) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(20),
        color: backgriundColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 17,
              color: iconColor,
            ),
            width4,
            Text(
              title,
              style: TextStyle(color: color),
            )
          ],
        ),
      ),
    );
  }
}
