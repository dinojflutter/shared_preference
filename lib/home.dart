import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  var givenname = "No data saved";
  static const keyname = "name";
  var namecontroller = TextEditingController();

  @override
  void initState() {
    super.initState();
    getsave();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Shared Preference"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              decoration: InputDecoration(
                  hintText: "Enter Name",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18))),
              controller: namecontroller,
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              // var namesave = ;
              var prefs = await SharedPreferences.getInstance();
              prefs.setString(keyname, namecontroller.text.toString());
            },
            child: const Text("Save"),
          ),
          Text(
            givenname,
            style: TextStyle(color: Colors.black),
          )
        ],
      ),
    );
  }

  void getsave() async {
    var prefs = await SharedPreferences.getInstance();
    var getname = prefs.getString(keyname);
    givenname = getname ?? givenname;
  }
}
