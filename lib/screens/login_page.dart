import 'dart:convert';
import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:dealsdray_1/utils/otpsend.dart';
import 'package:dealsdray_1/utils/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;

class LoginScreenPage extends StatefulWidget {
  const LoginScreenPage({super.key});

  @override
  State<LoginScreenPage> createState() => _LoginScreenPageState();
}

class _LoginScreenPageState extends State<LoginScreenPage> {
  bool defSwitchValue = false;
  bool isButtonEnabled = false;
  TextEditingController _phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _phoneController.addListener(_checkPhoneNumber);
  }

  void _checkPhoneNumber() {
    setState(() {
      isButtonEnabled = _phoneController.text.length == 10;
    });
  }

  Future<void> sendOtp() async {
    final otpData = OtpSendApi(
      mobileNumber: _phoneController.text,
      deviceId: '66863b1b5120b12d7e1820ee', // Replace with actual device ID
    );

    final url = Uri.parse("http://devapiv4.dealsdray.com/api/v2/user/otp");

    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(otpData.toJson()),
      );

      if (response.statusCode == 200) {
        print("OTP sent successfully: ${response.body}");
        var data =jsonDecode(response.body.toString());
        print(data);
        // Optionally, navigate to the next screen or show a success message
      } else {
        print("Failed to send OTP: ${response.statusCode}");
        // Show an error message
      }
    } catch (e) {
      print("Error sending OTP: $e");
      // Handle the error, e.g., show an error message
    }
  }

  @override
  void dispose() {
    _phoneController.removeListener(_checkPhoneNumber);
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 20,
            left: 2,
            child: FloatingActionButton(
              onPressed: () {},
              child: Icon(CupertinoIcons.back, color: Vx.black, size: 30),
              elevation: 0,
              backgroundColor: Vx.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(50)),
              ),
              splashColor: Vx.red200,
            ),
          ),
          Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 15),
                child: Center(
                  child: SizedBox(
                    height: 230,
                    child: Image.asset(
                      'lib/assets/img/dealsdray_img.png',
                      opacity: const AlwaysStoppedAnimation(.5),
                    ),
                  ),
                ),
              ),
              AnimatedToggleSwitch<bool>.size(
                current: defSwitchValue,
                values: const [false, true],
                indicatorSize: const Size.fromWidth(105),
                customIconBuilder: (context, local, global) => Text(
                  local.value ? 'Email' : 'Phone',
                  style: TextStyle(
                    color: Color.lerp(Vx.black, Vx.white, local.animationValue),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                iconAnimationType: AnimationType.onHover,
                style: ToggleStyle(
                  backgroundColor: Vx.gray300,
                  indicatorColor: Vx.red500,
                  borderColor: Colors.transparent,
                  borderRadius: BorderRadius.circular(50),
                ),
                selectedIconScale: 1,
                onChanged: (value) => setState(() => defSwitchValue = value),
              ),
              Container(
                margin: EdgeInsets.only(top: 40, right: MediaQuery.of(context).size.width / 5),
                child: "Glad to see you!".text.xl5.bold.make(),
              ),
              Container(
                margin: EdgeInsets.only(top: 25, right: MediaQuery.of(context).size.width / 4),
                child: "Please provide your phone number".text.color(Vx.gray500).xl.make(),
              ),
              Container(
                margin: EdgeInsets.only(left: 16, right: 16, top: 80),
                child: Theme(
                  data: Theme.of(context).copyWith(
                    textSelectionTheme: TextSelectionThemeData(
                      selectionColor: Vx.red200,
                      selectionHandleColor: Vx.red400,
                    ),
                  ),
                  child: TextField(
                    controller: _phoneController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    maxLength: 10,
                    cursorColor: Vx.red400,
                    decoration: InputDecoration(
                      counterText: "",
                      hintText: 'Phone',
                      hintStyle: TextStyle(color: Vx.gray500, fontSize: 18, fontWeight: FontWeight.w400),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Vx.red300, width: 2),
                      ),
                      contentPadding: EdgeInsets.only(bottom: 15),
                    ),
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              Opacity(
                opacity: isButtonEnabled ? 1.0 : 0.5,
                child: Container(
                  margin: EdgeInsets.only(top: 50, left: 5, right: 5),
                  width: MediaQuery.of(context).size.width,
                  height: 70,
                  child: ElevatedButton(
                    onPressed: (){
                      isButtonEnabled ? sendOtp : null;
                      Navigator.pushNamed(context, Myroutes.otpScreenRoute);
                    },
                    child: "SEND CODE".text.color(Vx.white).bold.xl2.make(),
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Vx.red500),
                      shape: WidgetStatePropertyAll(
                        RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
