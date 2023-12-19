import 'package:flutter/material.dart';
import 'package:your_login/Task1/HomeTemplate.dart';

import 'Login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login App',
      theme: ThemeData(

        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
      ),
      home: const meditation(),
    );
  }
}

