// ignore_for_file: prefer_const_constructors

import 'package:service/export.dart';
import 'package:service/service/authentication.dart';

class ServiceOtpVerification extends StatefulWidget {
  final String? descText;
  final String? whereToGo;
  String otp = "0000";
  ServiceOtpVerification({super.key, this.descText, this.whereToGo});

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
                      children: List<SizedBox>.generate(
                          4,
                          (i) => OtpDigit(context, (int x) {
                                widget.otp =
                                    widget.otp.replaceRange(i, i + 1, "$x");
                              })),
                    ),
                  ),

                  SizedBox(
                    height: 25,
                  ),

                  // Verify Button
                  MyTextButton(
                      text: 'Verify',
                      onPressed: () async {
                        if (await AuthServices().checkOTP(AuthServices().getUser()["email"], widget.otp)) {
                          if (mounted) {
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
                          } else {
                            throw "context not mounted";
                          }
                        } else {
                          throw "Invalid OTP";
                        }
                      }),
                ],
              ),
              Column(
                children: [
                  MyTextWidget(
                    text: 'Didn\'t received code?',
                    align: TextAlign.center,
                  ),
                  MyInkWellButton(
                      text: 'Resend',
                      onPressed: () {
                        AuthServices().requestOTP(AuthServices().getUser()["email"]);
                      }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

SizedBox OtpDigit(BuildContext context, Function(int) onChange) {
  return SizedBox(
    height: 68,
    width: 64,
    child: TextFormField(
      onChanged: (value) {
        if (value.length == 1) {
          FocusScope.of(context).nextFocus();
        }
        onChange(int.parse(value));
      },
      onSaved: (pin1) {},
      decoration: InputDecoration(
        enabled: true,
        enabledBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
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
          fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
      textAlign: TextAlign.center,
      keyboardType: TextInputType.number,
      inputFormatters: [
        LengthLimitingTextInputFormatter(1),
        FilteringTextInputFormatter.digitsOnly
      ],
    ),
  );
}
