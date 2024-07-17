// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType keyboardtype;
  final String hintText;
  final String? suffixText;
  final validator;

  final FocusNode _focusNode = FocusNode();

  MyTextField({
    super.key,
    required this.controller,
    required this.keyboardtype,
    required this.hintText,
    this.suffixText,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    // final parentWidth = MediaQuery.of(context).size.width;
    double screenWidth = MediaQuery.of(context).size.width;
    double size;
    if (screenWidth < 360) {
      size = screenWidth * 0.04;
    } else if (screenWidth < 480) {
      size = screenWidth * 0.045;
    } else if (screenWidth < 720) {
      size = screenWidth * 0.05;
    } else {
      size = screenWidth * 0.06;
    }
    return SizedBox(
      height: 60,
      child: TextFormField(
        controller: controller,
        maxLines: 1,
        focusNode: _focusNode,
        onEditingComplete: () {
          final text = controller.text;
          controller.text = text;
        },
        validator: validator,
        style: GoogleFonts.montserrat(
          textStyle: TextStyle(
            color: Colors.black54,
            fontWeight: FontWeight.w500,
            fontSize: size, //parentWidth/19,
          ),
        ),
        keyboardType: keyboardtype,
        decoration: InputDecoration(
          suffixText: suffixText,
          filled: true,
          fillColor: Colors.grey[100],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(2),
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              2,
            ),
            borderSide: BorderSide(color: Colors.black54),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: Colors.black, // focused border color
              width: 2.0, // focused border width
            ),
          ),
          hintText: hintText,
          hintStyle: GoogleFonts.montserrat(
            textStyle: TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.w500,
              fontSize: size,
            ),
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 16, // adjust horizontal padding as needed
            vertical: 12, // adjust vertical padding as needed
          ),
        ),
      ),
    );
  }
}
