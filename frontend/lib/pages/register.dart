import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:frontend/models/user.dart';
import 'package:frontend/providers/auth_provider.dart';
import 'package:frontend/widgets/custom_widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final first_name = TextEditingController();
  final last_name = TextEditingController();
  final _username = TextEditingController();
  final _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // APP BAR ------------------------------------------------------
      appBar: AppBar(
        title: Text(
          "Register",
          style: TextStyle(
            color: Color(0xFF5B8A72),
            fontSize: 26,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 245, 244, 239),
        elevation: 0,
        iconTheme: IconThemeData(
          color: Color(0xFF5B8A72),
          size: 30,
        ),
      ),

      // body ----------------------------------------------------------
      body: SafeArea(
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Image.asset(
                "assets/images/hiking.webp",
                width: 400,
              ),
            ),
            const Text(
              "Please fill in the required fields",
              style: TextStyle(
                fontSize: 18,
                color: Color(0xFF56776C),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // FIRST NAME -------------------
                        CustomInputField(
                          width: 145,
                          controller: first_name,
                          hintText: "First Name",
                          hiddenText: false,
                        ),

                        SizedBox(
                          width: 10,
                        ),

                        // LAST NAME -------------------
                        CustomInputField(
                          width: 145,
                          controller: last_name,
                          hintText: "Last Name",
                          hiddenText: false,
                        )
                      ],
                    ),

                    const SizedBox(
                      height: 15,
                    ),

                    // USERNAME -------------------------
                    CustomInputField(
                        width: 300,
                        controller: _username,
                        hintText: "enter your username",
                        icon: Icon(Icons.person),
                        hiddenText: false),

                    const SizedBox(height: 15),

                    // PASSWORD --------------------------
                    CustomInputField(
                      width: 300,
                      controller: _password,
                      hintText: "enter your password",
                      icon: Icon(Icons.password),
                      hiddenText: true,
                    ),

                    const SizedBox(
                      height: 20,
                    ),
                    // FORM BUTTON
                    CustomButton(
                      width: 300,
                      onPressed: () {
                        // REGISTRATION BUTTON FUNCTION HERE --------
                        context.read<AuthProvider>().register(
                              user: User(
                                  firstName: first_name.text,
                                  lastName: last_name.text,
                                  username: _username.text,
                                  password: _password.text),
                            );
                        context.push("/home");
                      },
                      buttonText: "Register",
                    ),
                  ],
                )),
            SizedBox(
              height: 50,
            )
          ],
        )),
      ),
    );
  }
}
