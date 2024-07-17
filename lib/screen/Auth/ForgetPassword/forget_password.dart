// ignore_for_file: prefer_const_constructors

import 'package:service/export.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
                  MyHeadingTextWidget(text: forgetPasswordHead),

                  // desc
                  MyDescTextWidget(
                    text: forgetPassDesc,
                  ),

                  SizedBox(
                    height: 25,
                  ),

                  MyTextField(
                    controller: emailController,
                    keyboardtype: TextInputType.emailAddress,
                    hintText: enterYourEmail,
                  ),

                  SizedBox(
                    height: 30,
                  ),

                  // Verify Button
                  MyTextButton(
                    text: sendCode,
                    onPressed: () {
                      Navigator.pushNamed(context, 'otpemail');
                    },
                  ),
                ],
              ),
              Column(
                children: [
                  MyTextWidget(text: forgetPassword),
                  MyInkWellButton(
                    text: login,
                    onPressed: () {
                      Navigator.pushNamed(context, 'loginemail');
                    },
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
