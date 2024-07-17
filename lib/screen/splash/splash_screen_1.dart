// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:service/export.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreenOne extends StatefulWidget {
  final bool onboarding;
  const SplashScreenOne({super.key, this.onboarding = false});

  @override
  State<SplashScreenOne> createState() => _SplashScreenOneState();
}

class _SplashScreenOneState extends State<SplashScreenOne> {
  User? user;
  @override
  void initState() {
    super.initState();
    user = FirebaseAuth.instance.currentUser;
    // Navigate to the onboarding screen after 3 seconds
    Future.delayed(Duration(seconds: 3), () {
      if (user != null) {
        Navigator.pushNamed(context, 'dashboard');
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => OnboardingScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
          // # Splash Text : ----> RAPSAPP
          child: Text(
            "RAPSAPP",
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w600,
              textStyle: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: 30,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
