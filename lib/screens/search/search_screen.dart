import 'package:flutter/material.dart';
import 'package:food_app/screens/search/search_item.dart';
import 'package:food_app/utils/colors.dart';
import 'package:food_app/widgets/sizedBox.dart';


class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: bColor),
        title: Text("Search"),
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Icon(Icons.menu_rounded),
          ),
        ],
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text("Items"),
            
          ),
          Container(
            height: 50,
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none
                ),
                fillColor: Color.fromARGB(255, 234, 234, 234),
                filled: true,
                hintText: "Search for items in the store",
                suffixIcon: Icon(Icons.search)
              ),
            ),
          ),
          height12,
          SearchItem(img: "assets/images/img3.png",),
          SearchItem(img: "assets/images/img7.png",),
          SearchItem(img: "assets/images/img11.png",),
        ],
      ),
    );
  }
}