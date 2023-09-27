import 'package:flutter/material.dart';
import 'package:food_app/widgets/sizedBox.dart';

import '../utils/colors.dart';

 Widget drawerSide() {
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
    );
  }

 

  Widget drawerItemList({required IconData icon,required String title}) {
    return ListTile(
      leading: Icon(icon,size: 32,),
      title: Text(title,style: TextStyle(color: bColor.withOpacity(0.4)),),
    );
  }