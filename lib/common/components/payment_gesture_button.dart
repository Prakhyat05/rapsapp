// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:service/common/components/my_head_payment_text.dart';
import 'package:service/common/components/my_payment_desc.dart';

class PaymentGestureButton extends StatefulWidget {
  final VoidCallback onPressed;
  final String hintText1;
  final String hintText2;
  final String? imageLocation;
  const PaymentGestureButton({
    super.key,
    required this.onPressed,
    required this.hintText1,
    required this.hintText2,
    this.imageLocation,
  });

  @override
  State<PaymentGestureButton> createState() => _PaymentGestureButtonState();
}

class _PaymentGestureButtonState extends State<PaymentGestureButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Container(
        height: 75,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.black54,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(2),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  widget.imageLocation != null
                      ? Image.asset(
                          widget.imageLocation!,
                          width: 25,
                          height: 25,
                          color: Colors.black,
                        )
                      : Container(),
                  SizedBox(
                    width: 10,
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      
                      MyPaymentHeading(text: widget.hintText1),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      
                      MyPaymentDescription(text: widget.hintText2,),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                ],
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
