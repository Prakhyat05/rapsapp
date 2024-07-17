import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyPaymentDescription extends StatelessWidget {
   final String text;
  const MyPaymentDescription({super.key,required this.text});

  @override
  Widget build(BuildContext context) {
    final parentWidth = MediaQuery.of(context).size.width;
    return Text(
      text,
      textAlign: TextAlign.start,
      style: GoogleFonts.montserrat(
        fontWeight: FontWeight.w400,
        textStyle: TextStyle(
          color: Colors.black54,
          fontSize: parentWidth / 20,
        ),
      ),
    );
  }
}