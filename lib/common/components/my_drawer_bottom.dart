// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:service/common/components/my_headingtwo.dart';
import 'package:service/common/components/my_text_widget.dart';
import 'package:service/export.dart';

class MyDrawerBottom extends StatefulWidget {
  const MyDrawerBottom({super.key});

  @override
  State<MyDrawerBottom> createState() => _MyDrawerBottomState();
}

class _MyDrawerBottomState extends State<MyDrawerBottom> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {},
              icon: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, 'loginemail');
                    },
                    child: MySecondHeading(
                      text: 'Logout',
                      fontWeight: FontWeight.w500,
                      fontsize: 18,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.logout,
                    color: Colors.black54,
                  ),
                ],
              ),
            ),
            MyTextWidget(
              text: 'Version 0.1 (Alpha Testing)',
              fontSize: 12,
              align: TextAlign.center,
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
