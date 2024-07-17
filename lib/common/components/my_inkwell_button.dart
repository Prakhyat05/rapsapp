// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyInkWellButton extends StatelessWidget {
  final String text;
  final double? fontsize;
  final VoidCallback onPressed;
  const MyInkWellButton(
      {super.key, required this.text, required this.onPressed, this.fontsize});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Text(
        text,
        style: GoogleFonts.montserrat(
          fontWeight: FontWeight.w600,
          textStyle: TextStyle(
            color: Color.fromARGB(255, 53, 194, 194),
          ),
          fontSize: fontsize ?? 20,
        ),
      ),
    );
  }
}
