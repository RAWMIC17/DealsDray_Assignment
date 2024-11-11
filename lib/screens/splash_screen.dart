import 'dart:convert';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:dealsdray_1/screens/homepage.dart';
import 'package:dealsdray_1/screens/login_page.dart';
import 'package:dealsdray_1/utils/colors.dart';
import 'package:dealsdray_1/utils/routes.dart';
import 'package:dealsdray_1/utils/splashapi.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:http/http.dart' as http;
import 'package:velocity_x/velocity_x.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();
    sendSplashApiData(); // Send API data on splash screen load
  }

  Future<void> sendSplashApiData() async {
    final splashApiData = SplashApi(
      deviceType: 'andriod',
      deviceId: 'C6179909526098',
      deviceName: 'Samsung-MT200',
      deviceOsVersion: '2.3.6',
      deviceIpAddress: '11.433.445.66',
      lat: 9.9312, 
      long: 76.2673, 
      buyerGcmid: '', 
      buyerPemid: '', 
      app: App(
        version: '1.20.5',
        installTimeStamp: DateTime.now(),
        uninstallTimeStamp: DateTime.now(),
        downloadTimeStamp: DateTime.now(),
      ),
    );

    final url = Uri.parse("http://devapiv4.dealsdray.com/api/v2/user/device/add");
    
    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(splashApiData.toJson()),
      );

      if (response.statusCode == 200) {
        print("Data sent successfully: ${response.body}");
      } else {
        print("Failed to send data: ${response.statusCode}");
      }
    } catch (e) {
      print("Error sending data: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Mycolors.backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 180),
          SizedBox(
            height: 160,
            child: Image.asset('lib/assets/img/dealsdray_img.png'),
          ),
          const SizedBox(height: 50),
          SizedBox(
            height: 120,
            child: AnimatedSplashScreen(
              splash: Lottie.asset('lib/assets/animations/Animation - 1731176019942.json'),
              nextScreen: LoginScreenPage(),
              duration: 3000,
              splashIconSize: 80,
              splashTransition: SplashTransition.fadeTransition,
              curve: Curves.easeInOut,
              centered: true,
            ),
          ),
        ],
      ),
    );
  }
}
//9011470243