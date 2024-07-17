// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreenTwo extends StatelessWidget {
  const SplashScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Bottom Layer
          Stack(
            children: [
              Align(
                alignment: Alignment.bottomRight,
                child: Image.asset('assets/images/plumber/plum.png',
                    fit: BoxFit.fitHeight,
                    height: MediaQuery.of(context).size.height * 0.7,
                    width: MediaQuery.of(context).size.width * 0.6),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Image.asset(
                    'assets/images/engineers/woman-engineers.png',
                    fit: BoxFit.cover,
                    height: MediaQuery.of(context).size.height * 0.6,
                    width: double.infinity),
              ),
            ],
          ),

          // opacity
          Container(
            color:
                Colors.black.withOpacity(0.75), // Grey color with 50% opacity
            height: double.infinity,
            width: double.infinity,
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // RASPAPP TEXT
              Center(
                child: Text(
                  "RAPSAPP",
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w700,
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.only(bottom: 75),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // SIGNUP BUTTON
                  TextButton(
                    style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all<Size>(Size(300, 65)),
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Color(0x12121212).withOpacity(1),
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      "Signup",
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w300,
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ),
            
                  SizedBox(
                    height: 35,
                  ),
            
                  // LOGIN BUTTON
                  TextButton(
                    style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all<Size>(Size(300, 65)),
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Color(0xFFFFFFFF).withOpacity(1),
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      "Login",
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w500,
                        textStyle: TextStyle(
                          color: Color(0x12121212).withOpacity(1),
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
