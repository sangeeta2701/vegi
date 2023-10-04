
import 'package:flutter/material.dart';
import 'package:food_app/screens/Profile/my_profile_screen.dart';
import 'package:food_app/screens/Review%20Cart/review_cart_screen.dart';
import 'package:food_app/widgets/sizedBox.dart';

import '../utils/colors.dart';

class DrawerSide extends StatelessWidget {
  const DrawerSide({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
                    backgroundImage: AssetImage("assets/images/img15.png"),
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
          drawerItemList(
              icon: Icons.home_outlined, title: "Home", ontap: () {}),
          drawerItemList(
              icon: Icons.shopping_bag_outlined,
              title: "Review Cart",
              ontap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ReviewCartScreen(),),);

              }),
          drawerItemList(
              icon: Icons.person_outlined,
              title: "My Profile",
              ontap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>MyProfileScreen()));
              }),
          drawerItemList(
              icon: Icons.notifications_outlined,
              title: "Notifications",
              ontap: () {}),
          drawerItemList(
              icon: Icons.star_border_outlined,
              title: "Rating & Review",
              ontap: () {}),
          drawerItemList(
              icon: Icons.favorite_border, title: "Wishlist", ontap: () {}),
          drawerItemList(
              icon: Icons.feed_outlined,
              title: "Raise a Complaint",
              ontap: () {}),
          drawerItemList(
              icon: Icons.question_answer_outlined,
              title: "FAQs",
              ontap: () {}),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              height: 250,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Contact Support",
                    style: TextStyle(
                        color: bColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                  height8,
                  Row(
                    children: [
                      Text(
                        "Call Us:",
                        style: TextStyle(color: bColor.withOpacity(0.5)),
                      ),
                      width16,
                      Text(
                        "+919979850588",
                        style: TextStyle(color: bColor),
                      )
                    ],
                  ),
                  height4,
                  Row(
                    children: [
                      Text(
                        "Mail Us:",
                        style: TextStyle(color: bColor.withOpacity(0.5)),
                      ),
                      width16,
                      Text(
                        "vegiSupport@gmail.com",
                        style: TextStyle(color: bColor),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
  }
}

Widget drawerItemList(
    {required IconData icon,
    required String title,
    required VoidCallback ontap}) {
  return ListTile(
    onTap: ontap,
    leading: Icon(
      icon,
      size: 32,
    ),
    title: Text(
      title,
      style: TextStyle(color: bColor.withOpacity(0.6)),
    ),
  );
}
