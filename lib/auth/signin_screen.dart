import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:food_app/provider/user_provider.dart';
import 'package:food_app/utils/colors.dart';
import 'package:food_app/widgets/sizedBox.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

import '../screens/Home/home_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late UserProvider userProvider;
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> signup(BuildContext context) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();
    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      final AuthCredential authCredential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);

      // Getting users credential
      UserCredential result = await auth.signInWithCredential(authCredential);
      User? user = result.user;
      userProvider.addUserData(user!, user.displayName ?? "",
          user.email ?? "", user.photoURL ?? "");

      // ignore: unnecessary_null_comparison
      if (result != null) {
        // ignore: use_build_context_synchronously
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
      } // if result not null we simply call the MaterialpageRoute,
      // for go to the HomePage screen
    }
  }

  @override
  Widget build(BuildContext context) {
    userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  "assets/images/bg.png",
                ),
                fit: BoxFit.cover)),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text("Sign in to continue"),
          height12,
          Text(
            "Vegies",
            style: TextStyle(fontSize: 50, color: wColor, shadows: [
              BoxShadow(
                  blurRadius: 5,
                  // spreadRadius: 3,
                  color: greenColor,
                  offset: Offset(3, 3)),
            ]),
          ),
          height28,
          SignInButton(
            Buttons.Google,
            text: "Sign In with Google",
            onPressed: () {
              signup(context);
              // _googleSignUp().then((value) => Navigator.pushReplacement(context,
              //     MaterialPageRoute(builder: (context) => HomeScreen())));
            },
          ),
          height16,
          SignInButton(
            Buttons.Apple,
            text: "Sign In with Apple",
            onPressed: () {},
          ),
          height12,
          Text(
            "By signing in you are agreeing to our\nTerms and Privacy Policy",
            textAlign: TextAlign.center,
          ),
        ]),
      ),
    );
  }
}
