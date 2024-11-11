import 'dart:async';
import 'dart:convert';
import 'package:dealsdray_1/utils/colors.dart';
import 'package:dealsdray_1/utils/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:velocity_x/velocity_x.dart';

class OtpVerificationPage extends StatefulWidget {

  const OtpVerificationPage({super.key,r});

  @override
  State<OtpVerificationPage> createState() => _OtpVerificationPageState();
}

class _OtpVerificationPageState extends State<OtpVerificationPage> {

  @override
  late Timer _timer;
  int _remainingSeconds = 120;
  String otp = '9879';
  String deviceId = '62b43472c84bb6dac82e0504';
  String userId = '62b43547c84bb6dac82e0525';
  bool isError = false;

  final _otpControllers = List.generate(4, (_) => TextEditingController());

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    for (var controller in _otpControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingSeconds > 0) {
          _remainingSeconds--;
        } else {
          _timer.cancel();
        }
      });
    });
  }

  String _formatTime(int seconds) {
    final int minutes = seconds ~/ 60;
    final int secs = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')} : ${secs.toString().padLeft(2, '0')}';
  }

  Future<void> verifyOtp() async {
  otp = _otpControllers.map((controller) => controller.text).join();

  if (otp.length < 4) {
    setState(() => isError = true); // Show error if OTP is incomplete
    return;
  }

  // Check OTP value and navigate accordingly
  if (otp == "1246") {
    setState(() => isError = false);
    await Future.delayed(Duration(seconds: 1, milliseconds: 500)); // Delay before navigating to home screen
    Navigator.pushReplacementNamed(context, Myroutes.homeScreenRoute); // Navigate to Home Screen
  } else if (otp == "9879") {
    setState(() => isError = false);
    await Future.delayed(Duration(seconds: 1, milliseconds: 500)); // Delay before navigating to signup screen
    Navigator.pushReplacementNamed(context, Myroutes.signUpScreenRoute); // Navigate to Signup Screen
  } else {
    setState(() => isError = true); // Show error if OTP is incorrect
  }
}




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Mycolors.backgroundColor,
      body: Stack(
        children: [
          Positioned(
            top: 20,
            left: 2,
            child: FloatingActionButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, Myroutes.loginScreenRoute);
              },
              child: Icon(
                CupertinoIcons.back,
                color: Vx.black,
                size: 30,
              ),
              elevation: 0,
              backgroundColor: Vx.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(50)),
              ),
              splashColor: Vx.red200,
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 210,
                  margin: EdgeInsets.only(
                    top: 80,
                    right: MediaQuery.of(context).size.width / 2,
                  ),
                  child: Image.asset('lib/assets/img/undraw_Mail_re_duel.png'),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 30,
                    right: MediaQuery.of(context).size.width / 8-20,
                  ),
                  child: "OTP Verification".text.xl5.bold.make(),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 25,
                    right: MediaQuery.of(context).size.width / 6,
                    left: 25,
                  ),
                  child:
                      "We have sent a unique OTP number to your mobile number +91-8210128807"
                          .text
                          .color(Vx.gray500)
                          .xl
                          .make(),
                ),
                SizedBox(height: 45),
                Form(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: List.generate(
                      4,
                      (index) => SizedBox(
                        height: 68,
                        width: 64,
                        child: TextFormField(
                          controller: _otpControllers[index],
                          onChanged: (value) {
                            if (value.length == 1) {
                              if (index < 3) {
                                FocusScope.of(context).nextFocus();
                              } else {
                                verifyOtp();
                              }
                            }
                          },
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: isError ? Vx.red500 : Vx.black,
                          ),
                          cursorColor: Vx.red500,
                          decoration: InputDecoration(
                            hintText: "0",
                            hintStyle: TextStyle(color: Vx.gray400),
                            enabled: true,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            errorBorder: isError
                                ? OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Vx.red500, width: 2),
                                    borderRadius: BorderRadius.circular(15),
                                  )
                                : null,
                          ),
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                if (isError)
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      "Incorrect OTP, please try again",
                      style: TextStyle(color: Vx.red500, fontSize: 16),
                    ),
                  ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        " ${_formatTime(_remainingSeconds)}",
                        style: TextStyle(fontSize: 22),
                      ),
                      TextButton(
                        onPressed: _remainingSeconds == 0 ? _startTimer : null,
                        child: "SEND AGAIN"
                            .text
                            .xl2
                            .bold
                            .color(
                              _remainingSeconds == 0 ? Vx.red400 : Vx.gray400,
                            )
                            .make(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
