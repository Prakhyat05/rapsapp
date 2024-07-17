// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MyDrawerDivider extends StatelessWidget {
  const MyDrawerDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10),
      child: Divider(
        height: 2,
        color: Colors.grey,
      ),
    );
  }
}
