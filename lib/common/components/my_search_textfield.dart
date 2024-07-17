// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MySearchTextField extends StatefulWidget {
  const MySearchTextField({super.key});

  @override
  State<MySearchTextField> createState() => _MySearchTextFieldState();
}

class _MySearchTextFieldState extends State<MySearchTextField> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final parentWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      height: 50,
      width:MediaQuery.of(context).size.width <400? 290 :340,
      child: Row(
        children: [
          Expanded(
            child: TextField(
              maxLines: 1,
              style: GoogleFonts.montserrat(
                textStyle: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.w500,
                  fontSize: parentWidth / 19,
                ),
              ),
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color:  Colors.white,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                  borderSide: BorderSide(color:  Color.fromARGB(255, 150,150,150),),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                    color: Colors.white, // focused border color
                    width: 2.0, // focused border width
                  ),
                ),
                prefixIcon: Icon(Icons.search,size: 30,color: Color.fromARGB(200, 138, 154, 174),),
                hintText: 'Search',
                hintStyle: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                    color: Color.fromARGB(255,131, 145, 161),
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16, // adjust horizontal padding as needed
                  vertical: 12, // adjust vertical padding as needed
                ),
              ),
              controller: _controller,
            ),
          ),
        ],
      ),
    );
  }
}
