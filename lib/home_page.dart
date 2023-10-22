import 'package:flutter/material.dart';
import 'package:shared_preference/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: GestureDetector(
                onTap: () async {
                  var prefs = await SharedPreferences.getInstance();
                  prefs.setBool(SplashscreenState.LoginKey, false);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()));
                },
                child: Icon(Icons.logout)),
          )
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Text("Home"),
        ),
      ),
    );
  }
}
