// ignore_for_file: prefer_const_constructors

import 'package:service/export.dart';
import 'package:service/screen/Dashboard1/empty_state.dart';
import 'package:service/screen/snackBar.dart';
import 'package:service/service/authentication.dart';
import 'package:service/service/google_auth.dart';
import 'package:service/service/otp.dart';

final _formKey = GlobalKey<FormState>();

class RegisterWithEmail extends StatefulWidget {
  const RegisterWithEmail({super.key});
  static String nameSend = "";
  static String emailSend = "";

  @override
  State<RegisterWithEmail> createState() => _RegisterWithEmailState();
}

class _RegisterWithEmailState extends State<RegisterWithEmail> {
  final TextEditingController nameController = TextEditingController();
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

  /*String? validatePassword(String? value) {
    RegExp regex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    final isPasswordValid = regex.hasMatch(value ?? '');
    if (!isPasswordValid) {
      return 'Enter valid password';
    } else {
      return null;
    }
  }*/

  void dispose1() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
  }

  void signUpUser() async {
    String res = await AuthServices().signUPUser(
        email: emailController.text,
        password: passwordController.text,
        name: nameController.text);
    if (res == "success") {
      setState(() {
        isLoading = true;
      });
      requestOTP();
      await Navigator.pushNamed(context, 'otpemail');

      //sendOTP();
    } else {
      setState(() {
        isLoading = false;
      });
      showSnackBar(context, "Some Error Occurred");
      /*Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) =>
              showSnackBar(context, 'Some error Occurred! Try again')));*/
    }
  }

  @override
  Widget build(BuildContext context) {
    RegisterWithEmail.nameSend = nameController.text.toString();
    RegisterWithEmail.emailSend = emailController.text.toString();
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
                        validator: (name) => name!.length < 3
                            ? 'Name should be at least 3 characters'
                            : null,
                        hintText: enterYourName),

                    SizedBox(
                      height: 15,
                    ),

                    // Email
                    MyTextField(
                        controller: emailController,
                        keyboardtype: TextInputType.emailAddress,
                        validator: validateEmail,
                        hintText: enterYourEmail),

                    SizedBox(
                      height: 15,
                    ),

                    // Password
                    MyPasswordTextField(
                        controller: passwordController,
                        obsecureText: true,
                        validator: (password) => password!.length < 6
                            ? 'Password should be at least 6 characters'
                            : null,
                        hintText: enterYourPassword),

                    SizedBox(
                      height: 25,
                    ),

                    // SignUp Button
                    MyTextButton(
                        text: signUp,
                        onPressed: () {
                          _formKey.currentState!.validate();
                          signUpUser();
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
                          orSignUpWith,
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
                              Navigator.pushNamed(context, 'regphone');
                            },
                            location: phoneLogo),
                        MyInkWellIcon(
                            onPressed: () async {
                              await FirebaseServices().signInWithGoogle();
                              Navigator.pushNamed(context, 'profile_step1');
                            },
                            location: googleLogo),
                      ],
                    ),

                    SizedBox(
                      height:
                          MediaQuery.of(context).size.width < 400 ? 25 : 182,
                    ),

                    Column(
                      children: [
                        MyTextWidget(
                          text: alreadyHaveAnAccount,
                        ),
                        MyInkWellButton(
                            text: "Login Now",
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
