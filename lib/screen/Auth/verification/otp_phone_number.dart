// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
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

class OTPPhone extends StatefulWidget {
  const OTPPhone({super.key});

  @override
  State<OTPPhone> createState() => _OTPPhoneState();
}

class _OTPPhoneState extends State<OTPPhone> {
  TextEditingController pinController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;

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
                  MyHeadingTextWidget(text: 'OTP Verification'),

                  // desc
                  MyDescTextWidget(
                      text:
                          'Enter the verification code we just sent on your phone number.'),

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
                      text: 'Verify',
                      onPressed: () async {
                        try {
                          PhoneAuthCredential credential =
                              await PhoneAuthProvider.credential(
                                  verificationId:
                                      RegisterWithMobileNumber.verify,
                                  smsCode: pinController.text);
                          await auth
                              .signInWithCredential(credential)
                              .then((value) async {
                            Navigator.pushNamed(context, 'otpphoneverified');
                            await Future.delayed(Duration(seconds: 2));
                            // ignore: use_build_context_synchronously
                            Navigator.pushNamed(context, 'emptystate');
                          });
                        } catch (e) {}
                        ;
                      }),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width < 400 ? 151 : 350,
              ),
              Column(
                children: [
                  MyTextWidget(text: 'Didn\'t received code?'),
                  MyInkWellButton(text: 'Resend', onPressed: () {}),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
