import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomInputField extends StatelessWidget {
  CustomInputField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.icon,
    required this.hiddenText,
  }) : super(key: key);

  final TextEditingController controller;
  final String hintText;
  final Icon icon;
  final bool hiddenText;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      child: TextFormField(
        controller: controller,
        obscureText: hiddenText,
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: icon,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  CustomButton({
    Key? key,
    required this.onPressed,
    required this.buttonText,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(buttonText),

        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 13.5),
          primary: Color(0xFF5B8A72),
          elevation: 0,
          textStyle: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
