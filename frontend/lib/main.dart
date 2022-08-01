import 'package:flutter/material.dart';
import 'package:frontend/pages/bottom_tabs.dart';
import 'package:frontend/pages/home.dart';
import 'package:frontend/pages/register.dart';
import 'package:frontend/pages/signin.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TabScreen(),
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromARGB(255, 245, 244, 239),

      ),
    );
  }
}
