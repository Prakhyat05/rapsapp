// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MySecondHeading extends StatelessWidget {
  final String text;
  final double? fontsize;
  final FontWeight? fontWeight;
  final Color? color;
  final TextAlign? align;

  const MySecondHeading({
    super.key,
    required this.text,
    this.fontsize,
    this.fontWeight,
    this.color,
    this.align,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      style: GoogleFonts.montserrat(
        fontWeight: fontWeight ?? FontWeight.w700,
        textStyle: TextStyle(
          color: color ?? Colors.black,
          fontSize: fontsize ?? 20,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
