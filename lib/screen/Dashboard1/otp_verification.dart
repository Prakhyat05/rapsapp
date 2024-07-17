// ignore_for_file: prefer_const_constructors

import 'package:service/export.dart';

class ServiceOtpVerification extends StatefulWidget {
  final String? descText;
  final String? whereToGo;
  const ServiceOtpVerification({super.key, this.descText, this.whereToGo});

  @override
  State<ServiceOtpVerification> createState() => _ServiceOtpVerificationState();
}

class _ServiceOtpVerificationState extends State<ServiceOtpVerification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: MyAppBarBackButton(),
        leadingWidth: 100,
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
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
                    text: widget.descText ??
                        'Enter the verification code to verify service.',
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  // boxes to put otp.....
                  Form(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 68,
                          width: 64,
                          child: TextFormField(
                            onChanged: (value) {
                              if (value.length == 1) {
                                FocusScope.of(context).nextFocus();
                              }
                            },
                            onSaved: (pin1) {},
                            decoration: InputDecoration(
                              enabled: true,
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: Color.fromARGB(
                                    255,
                                    53,
                                    194,
                                    193,
                                  ),
                                ),
                                borderRadius: BorderRadius.circular(
                                  5,
                                ),
                              ),
                            ),
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly
                            ],
                          ),
                        ),

                        // 2nd

                        SizedBox(
                          height: 68,
                          width: 64,
                          child: TextFormField(
                            onChanged: (value) {
                              if (value.length == 1) {
                                FocusScope.of(context).nextFocus();
                              }
                            },
                            onSaved: (pin2) {},
                            decoration: InputDecoration(
                              enabled: true,
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: Color.fromARGB(
                                    255,
                                    53,
                                    194,
                                    193,
                                  ),
                                ),
                                borderRadius: BorderRadius.circular(
                                  5,
                                ),
                              ),
                            ),
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly
                            ],
                          ),
                        ),

                        // 3rd
                        SizedBox(
                          height: 68,
                          width: 64,
                          child: TextFormField(
                            onChanged: (value) {
                              if (value.length == 1) {
                                FocusScope.of(context).nextFocus();
                              }
                            },
                            onSaved: (pin3) {},
                            decoration: InputDecoration(
                              enabled: true,
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 4,
                                  color: Color.fromARGB(
                                    255,
                                    53,
                                    194,
                                    193,
                                  ),
                                ),
                                borderRadius: BorderRadius.circular(
                                  5,
                                ),
                              ),
                            ),
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly
                            ],
                          ),
                        ),

                        // 4th
                        SizedBox(
                          height: 68,
                          width: 64,
                          child: TextFormField(
                            onChanged: (value) {
                              if (value.length == 1) {
                                FocusScope.of(context).nextFocus();
                              }
                            },
                            onSaved: (pin4) {},
                            decoration: InputDecoration(
                              enabled: true,
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: Color.fromARGB(
                                    255,
                                    53,
                                    194,
                                    193,
                                  ),
                                ),
                                borderRadius: BorderRadius.circular(
                                  5,
                                ),
                              ),
                            ),
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 25,
                  ),

                  // Verify Button
                  MyTextButton(
                      text: 'Verify',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Step6(
                                imagelocation: verificationImage,
                                text: 'Verfied',
                                whereToGo:
                                    widget.whereToGo ?? 'startingService'),
                          ),
                        );
                      }),
                ],
              ),
              Column(
                children: [
                  MyTextWidget(
                    text: 'Didn\'t received code?',
                    align: TextAlign.center,
                  ),
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
