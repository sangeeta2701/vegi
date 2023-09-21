import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:food_app/utils/colors.dart';
import 'package:food_app/widgets/sizedBox.dart';



class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/images/bg.png",),fit: BoxFit.cover)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Sign in to continue"),
            height12,
            Text("Vegies",style: TextStyle(
              fontSize: 50,
              color: wColor,
              shadows: [
                BoxShadow(blurRadius: 5,
                // spreadRadius: 3,
                color: themeColor,
                offset: Offset(3, 3)),
                
              ]
            ),),
            height28,
            SignInButton(
  Buttons.Google,
  text: "Sign In with Google",
  onPressed: () {},
),
height16,
 SignInButton(
  Buttons.Apple,
  text: "Sign In with Apple",
  onPressed: () {},
),
height12,
Text("By signing in you are agreeing to our\nTerms and Privacy Policy",textAlign: TextAlign.center,),
        ]),
      ),
    );
  }
}