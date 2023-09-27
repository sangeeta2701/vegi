import 'package:flutter/material.dart';
import 'package:food_app/utils/colors.dart';
import 'package:food_app/widgets/sizedBox.dart';

import '../../widgets/singleProduct.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      drawer: Drawer(
        child: Container(
          color: themeColor,
          child: ListView(
            children: [
              DrawerHeader(
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 42,
                      backgroundColor: wColor,
                      child: CircleAvatar(
                        radius: 40,
                        backgroundColor: themeColor,
                      ),
                    ),
                    width12,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Welcome Guest"),
                        height4,
                        SizedBox(
                          height: 30,
                          child: OutlinedButton(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                side: BorderSide(width: 1, color: gColor)),
                            child: Text(
                              "Login",
                              style: TextStyle(
                                  color: bColor,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              drawerItemList(icon: Icons.home_outlined, title: "Home"),
              drawerItemList(icon: Icons.shopping_bag_outlined, title: "Review Cart"),
              drawerItemList(icon: Icons.person_outlined, title: "My Profile"),
              drawerItemList(icon: Icons.notifications_outlined, title: "Notifications"),
              drawerItemList(icon: Icons.star_border_outlined, title: "Rating & Review"),
              drawerItemList(icon: Icons.favorite_border, title: "Wishlist"),
              drawerItemList(icon: Icons.feed_outlined, title: "Raise a Complaint"),
              drawerItemList(icon: Icons.question_answer_outlined, title: "FAQs"),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  height: 250,
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Contact Support",style: TextStyle(color: bColor,fontSize: 14,fontWeight: FontWeight.w500),),
                    height8,
                    Row(children: [
                      Text("Call Us:",style: TextStyle(color: bColor.withOpacity(0.5)),),
                      width16,
                      Text("+919979850588",style: TextStyle(color: bColor),)
                    ],),
                    height4,
                    Row(children: [
                      Text("Mail Us:",style: TextStyle(color:bColor.withOpacity(0.5) ),),
                      width16,
                      Text("vegiSupport@gmail.com",style: TextStyle(color: bColor),)
                    ],)
                  ],),
                ),
              ),







            ],
          ),
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: themeColor,
        iconTheme: IconThemeData(color: bColor),
        title: Text(
          "Home",
          style: TextStyle(fontSize: 17, color: bColor),
        ),
        actions: [
          CircleAvatar(
            radius: 12,
            backgroundColor: Color(0xffd4d181),
            child: Icon(
              Icons.search,
              size: 17,
              color: bColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: CircleAvatar(
              radius: 12,
              backgroundColor: Color(0xffd4d181),
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
                        padding: const EdgeInsets.only(right: 130, bottom: 10),
                        child: Container(
                          height: 40,
                          width: 100,
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
              Text(
                "View All",
                style: TextStyle(
                    fontSize: 12, fontWeight: FontWeight.w400, color: gColor),
              )
            ],
          ),
          height16,
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                singleProductContainer("assets/images/img2.jpg", "Fresh Basil"),
                singleProductContainer(
                    "assets/images/img4.png", "Curry Leaves"),
                singleProductContainer("assets/images/img3.png", "Fresh Mint"),
                singleProductContainer("assets/images/img5.png", "Lemongrass"),
              ],
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
              Text(
                "View All",
                style: TextStyle(
                    fontSize: 12, fontWeight: FontWeight.w400, color: gColor),
              )
            ],
          ),
          height16,
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                singleProductContainer("assets/images/img6.png", "Fresh Apple"),
                singleProductContainer(
                    "assets/images/img9.png", "Semi Ripe Banana"),
                singleProductContainer("assets/images/img7.png", "Berries"),
                singleProductContainer("assets/images/img8.png", "Watermelon"),
              ],
            ),
          ),
        ]),
      ),
    );
  }

 

  Widget drawerItemList({required IconData icon,required String title}) {
    return ListTile(
      leading: Icon(icon,size: 32,),
      title: Text(title,style: TextStyle(color: bColor.withOpacity(0.4)),),
    );
  }
}
