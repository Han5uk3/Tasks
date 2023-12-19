import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:your_login/Login.dart';

class Myhome extends StatefulWidget {
  const Myhome({super.key});

  @override
  State<Myhome> createState() => _MyhomeState();
}

class _MyhomeState extends State<Myhome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("- You have successfully logged in ! -",style: TextStyle(color: Colors.white, fontSize: 20),),
          SizedBox(
            height: 60,
          ),
          Text("- Click on the button below to logout -",style: TextStyle(color: Colors.red.shade900, fontSize: 20),),
          SizedBox(
            height: 60,
          ),
          ElevatedButton(
              onPressed: () async {
                SharedPreferences pref = await SharedPreferences.getInstance();
                pref.remove("key1");
                pref.remove("key2");
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => loginpage(),
                    ));
              },
              child: Text("Logout"))
        ],
      )),
    );
  }
}
