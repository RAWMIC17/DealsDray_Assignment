import 'package:dealsdray_1/screens/carousel_loading.dart';
import 'package:dealsdray_1/screens/homepage.dart';
import 'package:dealsdray_1/screens/login_page.dart';
import 'package:dealsdray_1/screens/otp_verification_page.dart';
import 'package:dealsdray_1/screens/sign_up_page.dart';
import 'package:dealsdray_1/screens/splash_screen.dart';
import 'package:dealsdray_1/utils/routes.dart';
import 'package:flutter/material.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Future.delayed(const Duration(seconds: 1));

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: const LoginScreenPage(),
      initialRoute: Myroutes.splashScreenRoute,
      routes:  {
        Myroutes.splashScreenRoute: (context) => SplashScreenPage(),
        Myroutes.loginScreenRoute: (context) => LoginScreenPage(),
        Myroutes.otpScreenRoute: (context) => OtpVerificationPage(),
        Myroutes.signUpScreenRoute: (context) => SignUpPage(),
        Myroutes.homeScreenRoute: (context) => HomeScreenPage(),

      },
    );
  }
}
