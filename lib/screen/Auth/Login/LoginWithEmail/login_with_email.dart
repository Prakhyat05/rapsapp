// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:service/export.dart';
import 'package:service/screen/Dashboard1/empty_state.dart';
//import 'package:service/screen/Dashboard1/app_language.dart';
import 'package:service/service/authentication.dart';
import 'package:service/screen/snackBar.dart';

import '../../../../service/google_auth.dart';

final _formKey = GlobalKey<FormState>();

class LoginWithEmail extends StatefulWidget {
  const LoginWithEmail({super.key});

  @override
  State<LoginWithEmail> createState() => _LoginWithEmailState();
}

class _LoginWithEmailState extends State<LoginWithEmail> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  String? validateEmail(String? email) {
    RegExp emailRegex = RegExp('^[a-zA-Z0-9_.±]+@gmail.com');
    final isEmailValid = emailRegex.hasMatch(email ?? '');
    if (!isEmailValid) {
      return 'Please enter a valid email';
    }
    return null;
  }

  /*String? validatePassword(String value) {
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
  }*/

  void dispose1() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void logInUser() async {
    String res = await AuthServices().logInUser(
        email: emailController.text, password: passwordController.text);
    if (res == "success") {
      setState(() {
        isLoading = true;
      });
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => Dashboard()));
    } else {
      setState(() {
        isLoading = false;
      });
      showSnackBar(context, 'Enter Valid User credentials');
      /*Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => showSnackBar(context,)));*/
    }
  }

  @override
  Widget build(BuildContext context) {
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
                MyHeadingTextWidget(text: welcomeBackMessage),

                // space
                SizedBox(
                  height: 15,
                ),

                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 25,
                      ),

                      // Email
                      MyTextField(
                        controller: emailController,
                        keyboardtype: TextInputType.emailAddress,
                        hintText: enterYourEmail,
                        validator: validateEmail,
                      ),

                      SizedBox(
                        height: 15,
                      ),

                      // Password
                      MyPasswordTextField(
                        controller: passwordController,
                        obsecureText: true,
                        hintText: enterYourPassword,
                        validator: (password) => password!.length < 6
                            ? 'Password should be at least 6 characters'
                            : null,
                      ),

                      SizedBox(
                        height: 25,
                      ),

                      // Login Button
                      MyTextButton(
                          text: login,
                          onPressed: () {
                            _formKey.currentState!.validate();
                            logInUser();
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
                        height:
                            MediaQuery.of(context).size.width < 400 ? 15 : 25,
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
                        height: 15,
                      ),

                      // Another
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          MyInkWellIcon(
                              location: googleLogo,
                              onPressed: () async {
                                await FirebaseServices().signInWithGoogle();
                                Navigator.pushNamed(context, 'dashboard');
                              }),
                        ],
                      ),
                      SizedBox(
                        height:
                            MediaQuery.of(context).size.width < 400 ? 25 : 225,
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
                ),
              ],
            ),
          )),
    );
  }
}
