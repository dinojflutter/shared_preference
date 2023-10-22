import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preference/home_page.dart';
import 'package:shared_preference/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => SplashscreenState();
}

class SplashscreenState extends State<Splashscreen> {
  static const LoginKey = "Login";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    whereToGo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Icon(Icons.home),
      ),
    );
  }

  void whereToGo() async {
    var prefs = await SharedPreferences.getInstance();
    var islogin = prefs.getBool(LoginKey);

    Timer(Duration(seconds: 1), () {
      if (islogin != null) {
        if (islogin) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => const Home()));
        } else {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const LoginPage()));
        }
      } else {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const LoginPage()));
      }
    });
  }
}
