import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_app/models/review_cart_model.dart';
import 'package:food_app/provider/product_provider.dart';
import 'package:food_app/provider/review_cart_provider.dart';
import 'package:food_app/provider/user_provider.dart';
// import 'package:food_app/auth/signin_screen.dart';
import 'package:food_app/screens/Home/home_screen.dart';
import 'package:food_app/utils/colors.dart';
import 'package:provider/provider.dart';

// import 'auth/signin_screen.dart';

void main() async {
 WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //when we use multiple provider then we have to use multiprovider
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProductProvider>(create: (context) => ProductProvider(),),
        ChangeNotifierProvider<UserProvider>(create: (context) => UserProvider(),),
        ChangeNotifierProvider<ReviewCartProvider>(create: (context) => ReviewCartProvider(),),


      ],
      
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: themeColor,
          scaffoldBackgroundColor: bgColor,
          primarySwatch: Colors.amber,
        ),
        // home: SignInScreen(),
        home: HomeScreen(),
      ),
    );
  }
}
