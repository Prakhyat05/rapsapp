import 'package:service/screen/onboarding_screen/onboarding_info.dart';

class OnboardingItems {
  List<OnboardingInfo> items = [
    OnboardingInfo(
      title: "Welcome to\n RAPSAPP",
      descriptions:
          "Discover endless opportunities by connecting with clients who need your skills.",
      image: "assets/images/plumber/plumber.png",
    ),
    OnboardingInfo(
      title: "Manage Your\n Services",
      descriptions:
          "Easily manage your schedule, appointments, and client interactions.",
      image: "assets/images/painter/painter.png",
    ),
    OnboardingInfo(
      title: "Get Paid\n Securely",
      descriptions: "Safe, secure, and timely transactions guaranteed.",
      image: "assets/images/auto_mechanic/auto-mechanic.png",
    ),
  ];
}
