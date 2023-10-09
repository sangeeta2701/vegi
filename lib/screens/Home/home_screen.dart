import 'package:flutter/material.dart';
import 'package:food_app/provider/product_provider.dart';
import 'package:food_app/screens/product/product_overview_screen.dart';
import 'package:food_app/screens/search/search_screen.dart';
import 'package:food_app/utils/colors.dart';
import 'package:food_app/widgets/sizedBox.dart';
import 'package:provider/provider.dart';

import '../../widgets/drawer_side.dart';
import '../../widgets/singleProduct.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ProductProvider productProvider;
  @override
  void initState() {
    ProductProvider productProvider = Provider.of(context, listen: false);
    productProvider.fetchHerbsProductData();
    productProvider.fetchFruitProductData();
    productProvider.fetchRootProductData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    productProvider = Provider.of(context);
    // productProvider.fetchHerbsProductData();
    return Scaffold(
      // backgroundColor: bgColor,
      drawer: DrawerSide(),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: themeColor,
        iconTheme: IconThemeData(color: bColor),
        title: Text(
          "Home",
          style: TextStyle(fontSize: 17, color: bColor),
        ),
        actions: [
          GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SearchScreen(search: productProvider.getAllProductSearch,),
              ),
            ),
            child: CircleAvatar(
              radius: 12,
              backgroundColor: Color.fromARGB(255, 241, 238, 159),
              child: Icon(
                Icons.search,
                size: 17,
                color: bColor,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: CircleAvatar(
              radius: 12,
              backgroundColor: Color.fromARGB(255, 241, 238, 159),
              child: Icon(
                Icons.shopping_bag_outlined,
                size: 17,
                color: bColor,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(children: [
          Container(
            height: 150,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/img1.jpg"),
                  fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(10),
              // color: Colors.red,
            ),
            child: Row(children: [
              Expanded(
                  // flex: 2,
                  child: SizedBox(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 120, bottom: 10),
                        child: Container(
                          height: 35,
                          width: 120,
                          decoration: BoxDecoration(
                            color: themeColor,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(50),
                                bottomRight: Radius.circular(50)),
                          ),
                          child: Text(
                            "Vegi",
                            style: TextStyle(
                              fontSize: 20,
                              color: wColor,
                              shadows: [
                                BoxShadow(
                                  color: greenColor,
                                  blurRadius: 10,
                                  offset: Offset(3, 3),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: Text(
                          "30% OFF",
                          style: TextStyle(
                              fontSize: 30,
                              color: wColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: Text(
                          "on all vegetables",
                          style: TextStyle(
                              fontSize: 14,
                              color: wColor,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ]),
              )),
              Expanded(child: Container()),
            ]),
          ),
          height20,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Herbs Seasonings",
                style: TextStyle(
                    fontSize: 18, fontWeight: FontWeight.w600, color: bColor),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchScreen(search: productProvider.getHerbsProductDataList,),),);
                },
                child: Text(
                  "View All",
                  style: TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w400, color: gColor),
                ),
              )
            ],
          ),
          height16,
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: productProvider.getHerbsProductDataList
                  .map((herbsProductData) {
                return singleProductContainer(
                  herbsProductData.productImage,
                  herbsProductData.productName,
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductOverviewScreen(
                          productName: herbsProductData.productName,
                          productImage: herbsProductData.productImage,
                          productPrice: herbsProductData.productrice,
                        ),
                      ),
                    );
                  },
                  herbsProductData.productrice,
                );
              }).toList(),
              // children: [
              // singleProductContainer("assets/images/img2.png", "Fresh Basil",
              //     () {
              //   Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //       builder: (context) => ProductOverviewScreen(
              //         productName: "Fresh Basil",
              //         productImage: "assets/images/img2.png",
              //       ),
              //     ),
              //   );
              // }),
              // singleProductContainer("assets/images/img4.png", "Curry Leaves",
              //     () {
              //   Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //       builder: (context) => ProductOverviewScreen(
              //         productName: "Curry Leaves",
              //         productImage: "assets/images/img4.png",
              //       ),
              //     ),
              //   );
              // }),
              // singleProductContainer("assets/images/img3.png", "Fresh Mint",
              //     () {
              //   Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //       builder: (context) => ProductOverviewScreen(
              //         productName: "Fresh Mint",
              //         productImage: "assets/images/img3.png",
              //       ),
              //     ),
              //   );
              // }),
              // singleProductContainer("assets/images/img5.png", "Lemongrass",
              //     () {
              //   Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //       builder: (context) => ProductOverviewScreen(
              //         productName: "Lemongrass",
              //         productImage: "assets/images/img5.png",
              //       ),
              //     ),
              //   );
              // }),
              // ],
            ),
          ),
          height20,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Fresh Fruits",
                style: TextStyle(
                    fontSize: 18, fontWeight: FontWeight.w600, color: bColor),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchScreen(search: productProvider.getFruitsProductDataList,),),);
                },
                child: Text(
                  "View All",
                  style: TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w400, color: gColor),
                ),
              )
            ],
          ),
          height16,
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
                children: productProvider.getFruitsProductDataList
                    .map((fruitProductData) {
              return singleProductContainer(
                fruitProductData.productImage,
                fruitProductData.productName,
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductOverviewScreen(
                        productName: fruitProductData.productName,
                        productImage: fruitProductData.productImage,
                        productPrice: fruitProductData.productrice,
                      ),
                    ),
                  );
                },
                fruitProductData.productrice,
              );
            }).toList()
                // children: [
                //   singleProductContainer("assets/images/img6.png", "Fresh Apple",
                //       () {
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //         builder: (context) => ProductOverviewScreen(
                //           productName: "Fresh Apple",
                //           productImage: "assets/images/img6.png",
                //           productPrice: 150,
                //         ),
                //       ),
                //     );
                //   }, 150),
                //   singleProductContainer(
                //       "assets/images/img9.png", "Semi Ripe Banana", () {
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //         builder: (context) => ProductOverviewScreen(
                //           productName: "Semi Ripe Banana",
                //           productImage: "assets/images/img9.png",
                //           productPrice: 50,
                //         ),
                //       ),
                //     );
                //   }, 50),
                //   singleProductContainer("assets/images/img7.png", "Berries", () {
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //         builder: (context) => ProductOverviewScreen(
                //           productName: "Berries",
                //           productImage: "assets/images/img7.png",
                //           productPrice: 200,
                //         ),
                //       ),
                //     );
                //   }, 200),
                //   singleProductContainer("assets/images/img8.png", "Watermelon",
                //       () {
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //         builder: (context) => ProductOverviewScreen(
                //           productName: "Watermelon",
                //           productImage: "assets/images/img8.png",
                //           productPrice: 70,
                //         ),
                //       ),
                //     );
                //   }, 70),
                // ],
                ),
          ),
          height20,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Root Vegetables",
                style: TextStyle(
                    fontSize: 18, fontWeight: FontWeight.w600, color: bColor),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchScreen(search: productProvider.getRootProductDataList,),),);
                },
                child: Text(
                  "View All",
                  style: TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w400, color: gColor),
                ),
              )
            ],
          ),
          height16,
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
                children: productProvider.getRootProductDataList
                    .map((rootProductData) {
              return singleProductContainer(
                rootProductData.productImage,
                rootProductData.productName,
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductOverviewScreen(
                        productName: rootProductData.productName,
                        productImage: rootProductData.productImage,
                        productPrice: rootProductData.productrice,
                      ),
                    ),
                  );
                },
                rootProductData.productrice,
              );
            }).toList()
                // children: [
                //   singleProductContainer(
                //       "assets/images/img10.png", "Red Beetroot", () {
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //         builder: (context) => ProductOverviewScreen(
                //           productName: "Red Beetroot",
                //           productImage: "assets/images/img10.png",
                //           productPrice: 120,
                //         ),
                //       ),
                //     );
                //   }, 120),
                //   singleProductContainer("assets/images/img13.png", "Potato", () {
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //         builder: (context) => ProductOverviewScreen(
                //           productName: "Potato",
                //           productImage: "assets/images/img13.png",
                //           productPrice: 20,
                //         ),
                //       ),
                //     );
                //   }, 20),
                //   singleProductContainer(
                //       "assets/images/img12.png", "Fresh Radish", () {
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //         builder: (context) => ProductOverviewScreen(
                //           productName: "Fresh Radish",
                //           productImage: "assets/images/img12.png",
                //           productPrice: 30,
                //         ),
                //       ),
                //     );
                //   }, 30),
                //   singleProductContainer(
                //       "assets/images/img11.png", "Fresh Carrots", () {
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //         builder: (context) => ProductOverviewScreen(
                //           productName: "Fresh Carrots",
                //           productImage: "assets/images/img11.png",
                //           productPrice: 15,
                //         ),
                //       ),
                //     );
                //   }, 15),
                //   singleProductContainer("assets/images/img14.png", "Green Onion",
                //       () {
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //         builder: (context) => ProductOverviewScreen(
                //           productName: "Green Onion",
                //           productImage: "assets/images/img14.png",
                //           productPrice: 50,
                //         ),
                //       ),
                //     );
                //   }, 50),
                // ],
                ),
          ),
        ]),
      ),
    );
  }
}
