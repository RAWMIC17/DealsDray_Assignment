import 'dart:convert';
import 'package:dealsdray_1/utils/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _passwordVisible = false;
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController referralController = TextEditingController(); // Optional field controller

  String userId = '62a833766ec5dafd6780fc85'; // Example userId

  void _togglePasswordVisibility() {
    setState(() {
      _passwordVisible = !_passwordVisible;
    });
  }

  Future<void> signUp(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() => isLoading = true);

      // Build payload with referral code if it's provided
      final signupData = {
        "email": emailController.text,
        "password": passwordController.text,
        "userId": userId,
      };
      if (referralController.text.isNotEmpty) {
        signupData["referralCode"] = referralController.text;
      }

      final response = await http.post(
        Uri.parse("http://devapiv4.dealsdray.com/api/v2/user/email/referral"),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(signupData),
      );

      setState(() => isLoading = false);

      if (response.statusCode == 202) {
        // Navigate to home screen after a delay
        await Future.delayed(Duration(seconds: 2));
        Navigator.pushReplacementNamed(context, Myroutes.homeScreenRoute);
      } else {
        // Handle error (e.g., show a message to the user)
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Signup failed: User Not Found')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Stack(
          children: [
            Positioned(
              top: 20,
              left: 2,
              child: FloatingActionButton(
                onPressed: () => Navigator.pop(context),
                child: Icon(CupertinoIcons.back, color: Vx.black, size: 30),
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
                  Container(
                    margin: EdgeInsets.only(
                      top: 10, 
                      right: MediaQuery.of(context).size.width / 2.5,
                    ),
                    child: "Let's Begin!".text.xl5.bold.make(),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: 25, 
                      right: MediaQuery.of(context).size.width / 7,
                    ),
                    child: "Please enter your credentials to proceed"
                        .text
                        .color(Vx.gray500)
                        .xl
                        .make(),
                  ),
                  SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
                    child: Theme(
                      data: Theme.of(context).copyWith(
                        textSelectionTheme: TextSelectionThemeData(
                          selectionColor: Vx.red200,
                          selectionHandleColor: Vx.red400,
                        ),
                      ),
                      child: Column(
                        children: [
                          TextFormField(
                            controller: emailController,
                            cursorColor: Vx.red400,
                            decoration: InputDecoration(
                              hintText: 'Your Email',
                              hintStyle: TextStyle(
                                color: Vx.gray500, fontSize: 18, fontWeight: FontWeight.w400),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Vx.red300, width: 2),
                              ),
                            ),
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                            validator: (value) => value!.isEmpty ? 'Enter your email' : null,
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            controller: passwordController,
                            obscureText: !_passwordVisible,
                            cursorColor: Vx.red400,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                onPressed: _togglePasswordVisibility,
                                icon: Icon(
                                  _passwordVisible ? CupertinoIcons.eye_slash_fill : CupertinoIcons.eye_fill,
                                  color: Vx.gray500,
                                ),
                              ),
                              hintText: 'Create Password',
                              hintStyle: TextStyle(
                                color: Vx.gray500, fontSize: 18, fontWeight: FontWeight.w400),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Vx.red300, width: 2),
                              ),
                            ),
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                            validator: (value) => value!.isEmpty ? 'Enter your password' : null,
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            controller: referralController,
                            cursorColor: Vx.red400,
                            decoration: InputDecoration(
                              hintText: 'Referral Code (Optional)',
                              hintStyle: TextStyle(
                                color: Vx.gray500, fontSize: 18, fontWeight: FontWeight.w400),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Vx.red300, width: 2),
                              ),
                            ),
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 16, top: MediaQuery.of(context).size.height / 4 - 90),
                    alignment: Alignment.bottomRight,
                    child: SizedBox(
                      height: 72,
                      child: ElevatedButton(
                        onPressed: isLoading ? null : () => signUp(context),
                        child: isLoading
                            ? CircularProgressIndicator(color: Vx.white)
                            : Icon(CupertinoIcons.arrow_right, color: Vx.white),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Vx.red500),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
