// ignore_for_file: prefer_const_constructors

import 'package:pinput/pinput.dart';
import 'package:service/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinput/pinput.dart';
import 'package:service/common/components/my_appbar_back_button.dart';
import 'package:service/common/components/my_desc_text_widget.dart';
import 'package:service/common/components/my_heading_text_widget.dart';
import 'package:service/common/components/my_inkwell_button.dart';
import 'package:service/common/components/my_text_button.dart';
import 'package:service/common/components/my_text_widget.dart';

import '../Register/RegisterWithMobileNumber/register_with_mobile_number.dart';

class OTPEmail extends StatefulWidget {
  const OTPEmail({super.key});

  @override
  State<OTPEmail> createState() => _OTPEmailState();
}

class _OTPEmailState extends State<OTPEmail> {
  TextEditingController pinController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var code = "";
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: MyAppBarBackButton(),
        leadingWidth: 100,
        backgroundColor: Colors.white,
      ),
      body: SizedBox(
        child: Padding(
          padding: EdgeInsets.only(
            top: 30,
            bottom: 25,
            left: 25,
            right: 25,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyHeadingTextWidget(text: emailVerification),

                  // desc
                  MyDescTextWidget(text: emailVerificationDesc),

                  SizedBox(
                    height: 20,
                  ),

                  Pinput(
                      length: 6,
                      showCursor: true,
                      controller: pinController,
                      onCompleted: (pin) {
                        pin = code;
                      }),

                  SizedBox(
                    height: 25,
                  ),

                  // Verify Button
                  MyTextButton(
                      text: verify,
                      onPressed: () async {
                        bool res = await submitOTP(pinController.text);
                        if (res == true) {
                          Navigator.pushNamed(context, 'otpphoneverified');
                          await Future.delayed(Duration(seconds: 2));
                          await Navigator.pushNamed(context, 'profile_step1');
                        }
                      }),
                ],
              ),
              /*SizedBox(
                height: MediaQuery.of(context).size.width < 400 ? 151 : 350,
              ),*/
              Column(
                children: [
                  MyTextWidget(text: 'Didn\'t received code?'),
                  MyInkWellButton(text: 'Resend', onPressed: () {requestOTP();}),
                ],
              ),
              /*Column(
                children: [
                  MyTextWidget(text: didntRecivedCode),
                  MyInkWellButton(text: resend, onPressed: () {}),
                ],
              ),*/
            ],
          ),
        ),
      ),
    );
  }
}
