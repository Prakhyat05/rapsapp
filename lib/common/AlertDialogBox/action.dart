// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyAction extends StatelessWidget {
  final String pageNumber;
  const MyAction({super.key,required this.pageNumber});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        textTheme: TextTheme(
          bodyMedium:
              TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(right: 28),
        child: Container(
          height: 45,
          width: 45,
          decoration: BoxDecoration(
              border: Border.all(
                  width: 1, color: Color.fromARGB(255, 232, 236, 244)),
              borderRadius: BorderRadius.circular(5)),
          child: Center(
            child: Text(
              '$pageNumber/5',
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                textStyle: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 22,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
