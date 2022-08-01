import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:frontend/widgets/custom_widgets.dart';

class SigninPage extends StatelessWidget {
   SigninPage({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final _username = TextEditingController();
  final _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 251, 249, 241),
      body: SafeArea(
        child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
          
          children: [
            
            Text("Hello!", 
              style: TextStyle(
                fontSize: 50,
                color: Color(0xFF5B8A72),
                fontWeight: FontWeight.bold,
              ),),
            
            SizedBox(height: 10,),

            Text("Please login using your credentials.", 
              style: TextStyle(
                fontSize: 18,
                color: Color(0xFF56776C),
              ),),

            SizedBox(height: 25,),

            Form(
              key: _formKey,
                child: Column(
              children: [
                // USERNAME -------------------------
                CustomInputField(
                  width: 250,
                  controller: _username, 
                  hintText: "enter your username", 
                  icon: Icon(Icons.person), 
                  hiddenText: false), 
                
                SizedBox(height: 15),
                
                // PASSWORD --------------------------
                CustomInputField(
                  width: 250,
                  controller: _password, 
                  hintText: "enter your password", 
                  icon: Icon(Icons.password), 
                  hiddenText: true,
                  ),

                  SizedBox(height: 20,),
                  // FORM BUTTON
                  CustomButton(
                    width: 250,
                    onPressed: (){
                      // SING IN BUTTON FUNCTION HERE --------
                      // -------------------------------------
                    }, 
                    buttonText: "Sign in",
                    ),
              ],
            )),

            SizedBox(height: 20,),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Not a member?", 
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFF56776C),
                ), 
                ), 
                
                // REGISTER BUTTON
                CustomTextButton(
                  onPressed: () {
                    // push to register page here -----------
                }, 
                text: "Register",
                )
              ],
            ),
          ],
        )),
      ),
    );
  }
}
