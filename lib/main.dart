// ignore_for_file: prefer_const_constructors

import "package:service/screen/Auth/verification/otp_mobile.dart";
import "package:service/screen/ComingSoon.dart";
import "package:service/screen/Dashboard1/app_language.dart";
import "package:service/screen/Dashboard1/empty_state.dart";
import "package:service/screen/snackBar.dart";
import "package:shared_preferences/shared_preferences.dart";

import "export.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final onboarding = prefs.getBool('onboarding') ?? false;

  runApp(const MyApp());
}


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //User? user;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //initialRoute: 'profile_step1',
      theme : ThemeData(colorScheme: ColorScheme.light()),
      routes: {
        '/': (context) => SplashScreenOne(),
        'regemail': (context) => RegisterWithEmail(),
        'regphone': (context) => RegisterWithMobileNumber(),
        'loginemail': (context) => LoginWithEmail(),
        'loginphone': (context) => LoginWithMobileNumber(),
        'dashboard': (context) => Dashboard(),
        'profile': (context) => DashboardUserProfile(),
        'forgetpassword': (context) => ForgetPassword(),
        'otpemail': (context) => OTPEmail(),
        'otpphone': (context) => OTPPhone(),
        'otpemailverified': (context) => OTPVerified(),
        'otpphoneverified': (context) => OTPVerified(),
        'aa_1': (context) => ActivateAccount1(),
        'aa_2': (context) => ActivateAccount2(),
        'accs': (context) => AccountActivated(),
        'pay': (context) => Payment(),
        'call': (context) => Calling(),
        'chat': (context) => ChatPage(),
        'earning': (context) => Earning(),
        'clientOnGoingJob': (context) => ClientOnGoingJob(),
        'notification': (context) => NotificationPage(),
        'reviews': (context) => Reviews(),
        'profile_step1': (context) => Step1(),
        'profile_step2': (context) => Step2(),
        'profile_step3': (context) => Step3(),
        'profile_step4': (context) => Step4(),
        'profile_step5': (context) => Step5(),
        'view_appointments': (context) => ViewAppointments(),
        'manage_services': (context) => ServicePage(),
        'allReviews': (context) => Reviews(),
        'notificationPage': (context) => NotificationPage(),
        'serviceOTPVerification': (context) => ServiceOtpVerification(),
        'startingService': (context) => StartingAnimation(),
        'appLanguage': (context) => AppLanguage(),
        'comingsoon': (context) => Comingsoon(),
        'emptystate': (context) => ProviderDashboard(),
        'otpmobile': (context) => OtpMobile(),
      },
      //home: user != null ? const Dashboard() : const LoginWithEmail(),
    );
  }
}
