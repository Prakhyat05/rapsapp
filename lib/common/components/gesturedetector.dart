// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:service/common/components/my_text_widget.dart';

class MyGestureButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String hintText;
  final String? imageLocation;

  const MyGestureButton({
    super.key,
    required this.onPressed,
    required this.hintText,
    this.imageLocation,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: Colors.grey[100],
          border: Border.all(
            color: Colors.black54,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(2),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                MyTextWidget(
                  text: hintText,
                ),
              ],
            ),
            Row(
              children: [
                imageLocation != null
                    ? Image.asset(
                        imageLocation!,
                        width: 25,
                        height: 25,
                        color: Colors.grey,
                      )
                    : Container(),
                SizedBox(
                  width: 15,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
