// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountActivated extends StatelessWidget {
  const AccountActivated({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/accountactivation/Successmark.png',
                  width: 150,
                  height: 150,
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'Account Created Successfully',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w800,
                    textStyle: TextStyle(
                      color: Colors.black,
                    ),
                    fontSize: 30,
                  ),
            
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}