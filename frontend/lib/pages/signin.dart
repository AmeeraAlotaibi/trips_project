import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:frontend/models/user.dart';
import 'package:frontend/providers/auth_provider.dart';
import 'package:frontend/widgets/custom_widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

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
            Expanded(
                child: Image.asset(
              "assets/images/hiker-w.webp",
              width: 400,
            )),
            const Text(
              "Hello!",
              style: TextStyle(
                fontSize: 50,
                color: Color(0xFF5B8A72),
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              "Please login using your credentials.",
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
                      onPressed: () async {
                        await context.read<AuthProvider>().signin(
                              user: User(
                                  username: _username.text,
                                  password: _password.text),
                            );

                        context.go("/home");
                      },
                      buttonText: "Sign in",
                    ),
                  ],
                )),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Not a Member?",
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xFF2a3f34),
                  ),
                ),

                // REGISTER BUTTON
                CustomTextButton(
                  onPressed: () {
                    context.push("/register");
                  },
                  text: "Register",
                )
              ],
            ),
            const SizedBox(
              height: 50,
            )
          ],
        )),
      ),
    );
  }
}
