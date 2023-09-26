import 'package:flutter/material.dart';
import 'package:food_app/utils/colors.dart';
import 'package:food_app/widgets/sizedBox.dart';


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
      drawer: Drawer(),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: themeColor,
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
        child: ListView(children: [
          Container(
            height: 150,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/images/img1.jpg"),fit: BoxFit.cover),
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
                    padding: const EdgeInsets.only(right: 130
                    ,bottom: 10),
                    child: Container(
                      height: 40,
                      width: 100,
                      decoration: BoxDecoration(
                        color: themeColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10
                          ),
                          bottomLeft: Radius.circular(50),
                          bottomRight: Radius.circular(50)
                        ),
                      ),
                      child: Text("Vegi",style: TextStyle(
                        fontSize: 20,
                        color: wColor,shadows: [
                        BoxShadow(
                          color: greenColor,
                          blurRadius: 10,
                          offset: Offset(3, 3),
                        ),
                      ],),textAlign: TextAlign.center,),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Text("30% OFF",style: TextStyle(fontSize: 30,color: wColor,fontWeight: FontWeight.bold),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Text("on all vegetables",style: TextStyle(fontSize: 14,color: wColor,fontWeight: FontWeight.w400),),
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
            Text("Herbs Seasonings",style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: bColor
            ),),
            Text("View All",style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: gColor
            ),)
          ],),
          height16,
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              
              children: [
              singleProductContainer("assets/images/img2.jpg","Fresh Basil"),
              singleProductContainer("assets/images/img4.png","Curry Leaves"),
              singleProductContainer("assets/images/img3.png","Fresh Mint"),
              singleProductContainer("assets/images/img5.png","Lemongrass"),
            ],),
          ),
          height20,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Text("Fresh Fruits",style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: bColor
            ),),
            Text("View All",style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: gColor
            ),)
          ],),
          height16,
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              
              children: [
              singleProductContainer("assets/images/img6.png","Fresh Apple"),
              singleProductContainer("assets/images/img9.png","Semi Ripe Banana"),
              singleProductContainer("assets/images/img7.png","Berries"),
              singleProductContainer("assets/images/img8.png","Watermelon"),
              
            ],),
          ),
        ]),
      ),
    );
  }

  Widget singleProductContainer(String imag, String name) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
            height: 230,
            width: 150,
            decoration: BoxDecoration(
              color: wColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 5),
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(child: Image.asset(imag,height: 120,)),
                  Text(name,style: TextStyle(fontSize: 16,color: bColor,fontWeight: FontWeight.w500),),
                  height4,
                  Text("\$50/50gram",style: TextStyle(fontSize: 14,color: gColor,fontWeight: FontWeight.w400),),
                  height8,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.only(left: 4),
                          // color: gColor,
                          height: 30,
                          width: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: gColor.withOpacity(0.3),width: 1),
                          ),
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                            Expanded(child: Text("50 Gram",style: TextStyle(fontSize: 10,color: bColor,))),
                            Center(child: Icon(Icons.arrow_drop_down,color: themeColor,))
                          ],),
                        ),
                      ),
                      width4,
                      Expanded(
                        child: Container(
                          // color: themeColor,
                          height: 30,
                          width: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: gColor.withOpacity(0.3),width: 1),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                            Icon(Icons.remove,color: themeColor,size: 15,),
                            Text("1"),
                            Icon(Icons.add,color: themeColor,size: 15,),
                          ],),
                         
                        ),
                      ),
                    ],)
                ],
              ),
            ),
          );
  }
}