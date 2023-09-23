import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'package:food_app/auth/signin_screen.dart';
import 'package:food_app/screens/Home/home_screen.dart';

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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: SignInScreen(),
      home: HomeScreen(),
    );
  }
}
