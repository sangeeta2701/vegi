import 'package:flutter/material.dart';
import 'package:food_app/utils/colors.dart';
import 'package:food_app/widgets/drawer_side.dart';
import 'package:food_app/widgets/sizedBox.dart';

class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themeColor,
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: bColor),
        title: Text(
          "My Profile",
          style: TextStyle(fontSize: 18, color: bColor),
        ),
      ),
      drawer: DrawerSide(),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 100,
                  color: themeColor,
                ),
                Container(
                  height: 650,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                  decoration: BoxDecoration(
                    color: bgColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: ListView(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            width: 250,
                            height: 80,
                            padding: EdgeInsets.only(left: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Sangeeta Gupta",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: bColor,
                                      ),
                                    ),
                                    height8,
                                    Text("sangeeta@gmail.com")
                                  ],
                                ),
                                CircleAvatar(
                                  radius: 15,
                                  backgroundColor: themeColor,
                                  child: CircleAvatar(
                                    radius: 12,
                                    backgroundColor: bgColor,
                                    child: Icon(
                                      Icons.edit,
                                      color: themeColor,
                                      size: 15,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      listTile(Icons.shop_outlined, "My Orders"),
                      listTile(Icons.location_on_outlined, "Delivery Address"),
                      listTile(Icons.person_outline, "Refer A Friend"),
                      listTile(Icons.file_copy_outlined, "Terms & Conditions"),
                      listTile(Icons.policy_outlined, "Privacy Policy"),
                      listTile(Icons.add_chart, "About"),
                      listTile(Icons.exit_to_app_outlined, "Logout"),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 40,
            left: 30,
            // right: 50,
            child: CircleAvatar(
              radius: 50,
              backgroundColor: themeColor,
              child: CircleAvatar(
                radius: 48,
                backgroundColor: wColor,
                backgroundImage: AssetImage("assets/images/img15.png"),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget listTile(IconData icon,String title) {
    return Column(
      children: [
        Divider(),
        ListTile(
          leading: Icon(icon),
          title: Text(title),
          trailing: Icon(Icons.arrow_forward_ios,size: 17,),
        ),
      ],
    );
  }
}
