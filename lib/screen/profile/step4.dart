// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:service/common/AlertDialogBox/action.dart';
import 'package:service/common/components/my_appbar_back_button.dart';
import 'package:service/common/components/my_desc_text_widget.dart';
import 'package:service/common/components/my_heading_text_widget.dart';
import 'package:service/common/components/my_text_button.dart';
import 'package:service/common/components/my_textfiled.dart';

class Step4 extends StatefulWidget {
  Step4({super.key});
  static String addhar = "";

  @override
  State<Step4> createState() => _Step4State();
}

class _Step4State extends State<Step4> {
  final TextEditingController addharNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Step4.addhar = addharNumber.text.toString();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyAppBarBackButton(),
              Column(
                children: [
                  SizedBox(
                    height: 35,
                  ),
                  MyAction(pageNumber: '4'),
                ],
              )
            ],
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyHeadingTextWidget(text: 'KYC Needed'),
              MyDescTextWidget(
                  text: 'Secure Your Account with Aadhaar Verification'),
              SizedBox(
                height: 20,
              ),
              MyTextField(
                controller: addharNumber,
                keyboardtype: TextInputType.number,
                hintText: 'Enter your aadhaar number',
              ),
              SizedBox(
                height: 35,
              ),
              MyTextButton(
                  text: 'Next',
                  onPressed: () {
                    Navigator.pushNamed(context, 'profile_step5');
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
