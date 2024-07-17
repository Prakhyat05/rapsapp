// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:service/common/components/my_headingtwo.dart';
import 'package:service/common/components/my_inkwell_button.dart';

class MyDrawerHeader extends StatefulWidget {
  const MyDrawerHeader({super.key});

  @override
  State<MyDrawerHeader> createState() => _MyDrawerHeaderState();
}

class _MyDrawerHeaderState extends State<MyDrawerHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 25, left: 25, right: 25),
      width: MediaQuery.of(context).size.width,
      height: 200,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: Color.fromARGB(255, 217, 217, 217),
            radius: 50,
            child: Image.asset('assets/images/Dashboard/Profile.png'),
          ),
          SizedBox(height: 10),
          MySecondHeading(
            text: 'Ratn Govindam',
            fontWeight: FontWeight.w400,
            fontsize: 22,
          ),
          MyInkWellButton(
              text: 'Edit Profile',
              onPressed: () {
                Navigator.pushNamed(context, 'profile');
              }),
        ],
      ),
    );
  }
}
