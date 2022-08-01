import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Welcome Back,".toUpperCase(), 
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 30, 
                color: Color(0xFF5B8A72),
                fontWeight: FontWeight.bold,
                letterSpacing: 1.25,
                ),
              ),
              
              // will change this later to display the first name of the user
              Text("user".toUpperCase(), 
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 30, 
                color: Color(0xFF5B8A72),
                fontWeight: FontWeight.bold,
                letterSpacing: 1.25,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
