// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:service/common/components/my_headingtwo.dart';

class MyDrawerListTile extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final IconData myicons;

  const MyDrawerListTile({
    super.key,
    required this.onPressed,
    required this.myicons,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 10,
          ),
          Icon(
            myicons,
            color: Color.fromARGB(244, 74, 74, 74),
          ),
          SizedBox(
            width: 10,
          ),
          MySecondHeading(
            text: title,
            fontWeight: FontWeight.w500,
            fontsize: 18,
          )
        ],
      ),
    );
  }
}
