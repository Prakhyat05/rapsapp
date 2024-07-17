// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyDescTextWidget extends StatelessWidget {
  final String text;
  final double? fontSize;
  final Color? color;
  final TextAlign? align;
  const MyDescTextWidget({
    super.key,
    required this.text,
    this.color,
    this.align,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    final parentWidth = MediaQuery.of(context).size.width;
    return Text(
      text,
      textAlign: align ?? TextAlign.start,
      style: GoogleFonts.montserrat(
        fontWeight: FontWeight.w400,
        textStyle: TextStyle(
          color: color ?? Colors.black54,
          fontSize: fontSize ?? parentWidth / 20,
        ),
      ),
    );
  }
}
