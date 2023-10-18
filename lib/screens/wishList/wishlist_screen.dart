import 'package:flutter/material.dart';
import 'package:food_app/models/product_model.dart';
import 'package:food_app/provider/wish_list_provider.dart';
import 'package:food_app/utils/colors.dart';
import 'package:food_app/widgets/sizedBox.dart';
import 'package:provider/provider.dart';
import '../../widgets/single_item.dart';

// ignore: must_be_immutable
class WishlistScreen extends StatefulWidget {
  // const WishlistScreen({super.key});
 

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
   late WishListProvider wishListProvider;
  @override
  Widget build(BuildContext context) {
    wishListProvider = Provider.of(context);
    // reviewCartProvider.getReviewCartData();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: bColor),
        title: Text(
          "WishList",
          style: TextStyle(color: bColor, fontSize: 18),
        ),
      ),
      body: ListView.builder(
          itemCount: wishListProvider.getWishList.length,
          itemBuilder: (context, index) {
            ProductModel data =
                wishListProvider.getWishList[index];
            return Column(
              children: [
                height12,
                SingleItem(
                  productImage: data.productImage,
                  isBool: true,
                  productName: data.productName,
                  productPrice: data.productrice,
                  productId: data.productId,
                  productQuantity: data.productQuantity,
                  ondelete: () {},
                ),
              ],
            );
          }),
      
    );
  }
}
