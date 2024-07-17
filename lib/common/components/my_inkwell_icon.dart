// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class MyInkWellIcon extends StatelessWidget {
  final VoidCallback onPressed;
  final String location;
  const MyInkWellIcon({
    super.key,
    required this.onPressed,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
              color: Color.fromARGB(255, 225, 229, 238),
              spreadRadius: 0.1,
              blurRadius: 0.1,
              offset: Offset(0, 0.7))
        ]),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          child: Image.asset(location,
            width: 24,
            height: 24,
          ),
        ),
      ),
    );
  }
}
