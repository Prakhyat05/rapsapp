// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:service/export.dart';

class LoginWithMobileNumber extends StatefulWidget {
  const LoginWithMobileNumber({super.key});

  @override
  State<LoginWithMobileNumber> createState() => _LoginWithMobileNumberState();
}

class _LoginWithMobileNumberState extends State<LoginWithMobileNumber> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String? validatePassword(String value) {
    RegExp regex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (value.isEmpty) {
      return 'Please enter password';
    } else {
      if (!regex.hasMatch(value)) {
        return 'Enter valid password';
      } else {
        return null;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 55, left: 25, right: 25, bottom: 25),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Text
              MyHeadingTextWidget(text: welcomeBackMessage),

              // space
              SizedBox(
                height: 15,
              ),

              Column(
                children: [
                  SizedBox(
                    height: 15,
                  ),

                  // Phone
                  MyTextField(
                      controller: phoneController,
                      keyboardtype: TextInputType.phone,
                      hintText: enterYouPhoneNumber),

                  SizedBox(
                    height: 15,
                  ),

                  // Password
                  MyPasswordTextField(
                      controller: passwordController,
                      obsecureText: true,
                      validator:
                          validatePassword(passwordController.text.toString()),
                      hintText: enterYourPassword),

                  SizedBox(
                    height: 25,
                  ),

                  // Login Button
                  MyTextButton(
                      text: login,
                      onPressed: () {
                        Navigator.pushNamed(context, 'dashboard');
                      }),

                  SizedBox(
                    height: 15,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, 'forgetpassword');
                        },
                        child: Text(
                          forgetPassword,
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w400,
                            textStyle: TextStyle(
                              color: Colors.black38,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: MediaQuery.of(context).size.width < 400 ? 15 : 25,
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
                        orLoginWith,
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
                              Navigator.pushNamed(context, 'loginemail');
                            },
                            location: emailLogo),
                        MyInkWellIcon(onPressed: () {}, location: googleLogo),
                        MyInkWellIcon(onPressed: () {}, location: appleLogo),
                      ]),
                  SizedBox(
                    height: MediaQuery.of(context).size.width < 400 ? 25 : 50,
                  ),
                  Column(
                    children: [
                      MyTextWidget(text: dontHaveAnAcc),
                      MyInkWellButton(
                          text: regNow,
                          onPressed: () {
                            Navigator.pushNamed(context, 'regemail');
                          }),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
