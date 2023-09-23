import 'package:flutter/material.dart';
import 'package:food_app/utils/colors.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(backgroundColor: themeColor,
      iconTheme: IconThemeData(color: bColor),
      title: Text("Home",style: TextStyle(fontSize: 17,color: bColor),),
      actions: [
        CircleAvatar(
          radius: 12,
          backgroundColor: Color(0xffd4d181),
          child: Icon(Icons.search,size: 17,color: bColor,),
        ),
         Padding(
           padding: const EdgeInsets.symmetric(horizontal: 8),
           child: CircleAvatar(
            radius: 12,
            backgroundColor: Color(0xffd4d181),
            child: Icon(Icons.shopping_bag_outlined,size: 17,color: bColor,),
                 ),
         ),
      ],),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(children: [
          Container(
            height: 150,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/images/img1.jpg"),fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(10),
              // color: Colors.red,
            ),
            child: Row(children: [
              Expanded(child: Container()),
              Expanded(child: Container()),
            ]),
            
          ),
        ]),
      ),
    );
  }
}