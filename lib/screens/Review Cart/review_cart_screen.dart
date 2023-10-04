import 'package:flutter/material.dart';
import 'package:food_app/utils/colors.dart';
import 'package:food_app/widgets/sizedBox.dart';

import '../../widgets/single_item.dart';

class ReviewCartScreen extends StatelessWidget {
  const ReviewCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: bColor),
        title: Text("Review Cart",style: TextStyle(
          color: bColor,
          fontSize: 18
        ),),
      ),
      body: ListView(
        children: [
          height12,
          SingleItem(img: "assets/images/img3.png",isBool: true,),
          SingleItem(img: "assets/images/img7.png",isBool: true,),
          SingleItem(img: "assets/images/img11.png",isBool: true,),
        ],
      ),
      bottomNavigationBar: ListTile(
        title: Text("Total Amount"),
        subtitle: Text("\$170.00",style: TextStyle(color: greenColor.withOpacity(0.9)),),
        trailing: SizedBox(
          width: 150,
          child: MaterialButton(onPressed: (){},
          color: themeColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          
          ),
          child: Text("Submit"),),
        ),
      ),
    );
  }
}