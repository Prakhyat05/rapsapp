// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:service/common/components/my_text_button.dart';
import 'package:service/common/components/my_text_widget.dart';
import 'package:service/common/components/my_textfiled.dart';

class ActivateAccount2 extends StatefulWidget {
  const ActivateAccount2({
    super.key,
  });

  @override
  State<ActivateAccount2> createState() => _ActivateAccount2State();
}

class _ActivateAccount2State extends State<ActivateAccount2> {
  final TextEditingController upiID = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: EdgeInsets.all(25),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
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
                              text: 'Pay using UPI ID',
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/images/profile/Cross.png',
                                width: 25,
                                height: 25,
                                color: Colors.grey,
                              ),
                              SizedBox(
                                width: 15,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  // Upi
                  Container(
                    height: 250,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.black54,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 275,
                                child: MyTextField(
                                  controller: upiID,
                                  keyboardtype: TextInputType.text,
                                  hintText: 'Enter your upi id',
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          SizedBox(
                            width: 200,
                            child: MyTextButton(
                              text: 'Verify and Pay',
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
