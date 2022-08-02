import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

// INPUT FIELD ------------------------------------------
class CustomInputField extends StatelessWidget {
  CustomInputField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.icon,
    required this.hiddenText,
    required this.width,
  }) : super(key: key);

  final TextEditingController controller;
  final String hintText;
  final Icon? icon;
  final bool hiddenText;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: TextFormField(
        controller: controller,
        obscureText: hiddenText,
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: icon,
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: Colors.black38),
            borderRadius: BorderRadius.circular(5),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 2,
              color: Color(0xFF5F7161),
            ),
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
    );
  }
}

// BUTTON ------------------------------------------------------
class CustomButton extends StatelessWidget {
  CustomButton({
    Key? key,
    required this.onPressed,
    required this.buttonText,
    required this.width,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String buttonText;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
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

// TEXT BUTTON --------------------------------------------
class CustomTextButton extends StatelessWidget {
  CustomTextButton({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(text),
      style: TextButton.styleFrom(
          primary: Color(0xFF56776C),
          textStyle: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          )),
    );
  }
}
