// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:service/export.dart';
import 'package:service/screen/Auth/verification/otp_mobile.dart';

import '../../../../service/google_auth.dart';

final _formKey = GlobalKey<FormState>();

class RegisterWithMobileNumber extends StatefulWidget {
  const RegisterWithMobileNumber({super.key});

  static String verify = "";
  static String nameSend = "";

  @override
  State<RegisterWithMobileNumber> createState() =>
      _RegisterWithMobileNumberState();
}

class _RegisterWithMobileNumberState extends State<RegisterWithMobileNumber> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  //final TextEditingController passwordController = TextEditingController();
  final TextEditingController countrycode = TextEditingController();

  @override
  void initState() {
    countrycode.text = "+91";
    super.initState();
  }

  Widget build(BuildContext context) {
    RegisterWithMobileNumber.nameSend = nameController.text.toString();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.only(top: 75, left: 25, right: 25, bottom: 25),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Text
              MyHeadingTextWidget(text: createAnAccToGetStarted),

              // space
              SizedBox(
                height: 30,
              ),

              Form(
                key: _formKey,
                child: Column(
                  children: [
                    // Name
                    MyTextField(
                        controller: nameController,
                        keyboardtype: TextInputType.name,
                        hintText: enterYourName),

                    SizedBox(
                      height: 15,
                    ),

                    // Phone
                    MyTextField(
                        controller: phoneController,
                        keyboardtype: TextInputType.number,
                        validator: (phone) => phone!.length == 10
                            ? null
                            : 'Phone Number should be equal to 10 characters',
                        hintText: enterYouPhoneNumber),

                    SizedBox(
                      height: 15,
                    ),

                    // Password
                    //MyPasswordTextField(
                    //controller: passwordController,
                    //obsecureText: true,
                    //hintText: enterYourPassword),

                    //SizedBox(
                    //height: 25,
                    //),

                    // Register Button
                    MyTextButton(
                        text: signUp,
                        onPressed: () async {
                          _formKey.currentState!.validate();
                          await FirebaseAuth.instance.verifyPhoneNumber(
                            phoneNumber: countrycode.text.toString() +
                                phoneController.text.toString(),
                            verificationCompleted:
                                (PhoneAuthCredential credential) {},
                            verificationFailed: (FirebaseAuthException e) {},
                            codeSent:
                                (String verificationid, int? resendToken) {
                              RegisterWithMobileNumber.verify = verificationid;
                              Navigator.pushNamed(context, 'otpphone');
                            },
                            codeAutoRetrievalTimeout:
                                (String verificationid) {},
                          );
                        }),

                    SizedBox(
                      height: 40,
                    ),

                    //
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 1,
                            color: Colors.black38,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Or Signup with",
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w400,
                            textStyle: TextStyle(
                              color: Colors.black54,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: Container(
                            height: 1,
                            color: Colors.black38,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(
                      height: 20,
                    ),

                    // Another
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        MyInkWellIcon(
                            onPressed: () {
                              Navigator.pushNamed(context, 'regemail');
                            },
                            location: 'assets/logo/extra/Email.png'),
                        MyInkWellIcon(
                            onPressed: () async {
                              await FirebaseServices().signInWithGoogle();
                              Navigator.pushNamed(context, 'emptystate');
                            },
                            location: 'assets/logo/extra/google_logo.png'),
                      ],
                    ),

                    SizedBox(
                      height:
                          MediaQuery.of(context).size.width < 400 ? 25 : 266,
                    ),

                    Column(
                      children: [
                        MyTextWidget(text: 'Already have an account?'),
                        MyInkWellButton(
                            text: 'Login Now',
                            onPressed: () {
                              Navigator.pushNamed(context, 'loginemail');
                            }),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
