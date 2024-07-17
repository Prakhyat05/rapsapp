import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyPaymentHeading extends StatelessWidget {
  final String text;
  const MyPaymentHeading({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final parentWidth = MediaQuery.of(context).size.width;
    return Text(
      text,
      style: GoogleFonts.montserrat(
        fontWeight: FontWeight.w600,
        textStyle: TextStyle(
          color: Colors.black,
          fontSize: parentWidth / 19,
        ),
      ),
    );
  }
}
