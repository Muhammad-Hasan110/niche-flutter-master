// ignore_for_file: depend_on_referenced_packages, avoid_print

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_niche2/API/API.dart';
import 'package:login_niche2/signup/signup.dart';
import 'package:http/http.dart' as http;
import 'package:login_niche2/utils/flutterflow/flutter_flow_theme.dart';
import 'package:timer_builder/timer_builder.dart';
import 'login_Screen.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final api = API();
  bool isResendDisabled = false;
  int resendTimer = 30;
  int tempTimer = 30;
  Timer? _timer;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();

    super.dispose();
  }

  void startResendTimer() {
    setState(() {
      isResendDisabled = true;
      tempTimer = tempTimer * 2;
      resendTimer = tempTimer;
    });

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        resendTimer -= 1;
        if (resendTimer <= 0) {
          isResendDisabled = false;
          timer.cancel();
        }
      });
    });
  }

  bool isEmailValid(String email) {
    // Implement your email validation logic here
    // Example implementation using RegExp:
    return RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
        .hasMatch(email);
  }

  void showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.black87,
      elevation: 0,
      content: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          message,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      duration: const Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(
      snackBar,
    );
  }

  bool isAllFieldsValid(BuildContext context) {
    String email = _emailController.text;

    if (email.isEmpty) {
      showSnackBar(context, 'Email is required');
      return false;
    }

    if (!isEmailValid(email)) {
      showSnackBar(context, 'Invalid email');
      return false;
    }

    return true;
  }

  // Function to send the reset password request to the API
  final TextEditingController _emailController = TextEditingController();
  Future<void> sendResetPasswordRequest() async {
    final email = _emailController.text;
    final apiUrl = '${api.baseURL}user/resetpassword?email=$email';

    try {
      final response = await http.get(Uri.parse(apiUrl));
      print(response.body);
      if (response.statusCode == 200) {
        showResendFailedDialog(
          'Email send successfully',
          'Check your email to reset your password',
        );
        startResendTimer();

        // Success! Handle the response here (e.g., show a success message).
        // You can also navigate to a success screen if needed.
        print('Password reset request sent successfully.');
      } else {
        // Show dialog for failed resend
        showResendFailedDialog(
          'Resend Failed',
          'Failed to send verification email. Please try again later.',
        );
        print('Failed to send password reset request.');
      }
    } catch (e) {
      // Show dialog for failed resend (network error)
      showResendFailedDialog(
        'Resend Failed',
        'Failed to send verification email. Please check your internet connection.',
      );
      print('Error occurred: $e');
    }
  }

  void showResendFailedDialog(String dialogTitle, String errorMessage) {
    showDialog(
      context: context,
      builder: (context) => Theme(
        data: Theme.of(context).copyWith(
          dialogBackgroundColor: const Color.fromARGB(255, 218, 212, 207),
        ),
        child: AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          title: Text(
            dialogTitle,
            style: const TextStyle(
              color: Color.fromRGBO(33, 53, 85, 1.0),
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            errorMessage,
            style: const TextStyle(
              color: Color.fromRGBO(33, 53, 85, 1.0),
              fontSize: 16,
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                primary: const Color.fromRGBO(33, 53, 85, 1.0),
                onPrimary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'OK',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var fonte = 35.0;
    var fontSize = 15.0;
    if (Get.width <= 380) {
      fontSize = 13.0;
      fonte = 30;
    } else if (Get.width > 420 && Get.width <= 960) {
      fontSize = 19.0;
      fonte = 40;
    } else if (Get.width > 380 && Get.width <= 420) {
      fontSize = 17.0;
      fonte = 37;
    } else {
      fontSize = 20.0;
      fonte = 40;
    }
    final w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.keyboard_backspace,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()));
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  "Forgot Password",
                  style: GoogleFonts.workSans(
                      fontSize: fonte,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF323B60),
                      decoration: TextDecoration.none),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 6.0),
                child: Center(
                  child: Text(
                    "Please enter your email and we will send \nyou a link to return to your account",
                    style: GoogleFonts.workSans(
                        fontSize: fontSize,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF4F709C),
                        decoration: TextDecoration.none),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(height: w * 0.05 + h * 0.05),
              Stack(
                children: <Widget>[
                  Container(
                    width: w * 0.8,
                    height: h * 0.08,
                    margin: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                    padding: const EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromARGB(255, 51, 204, 255),
                          width: 1),
                      borderRadius: BorderRadius.circular(30),
                      shape: BoxShape.rectangle,
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(right: 3, top: 2, left: 25),
                      child: TextField(
                          controller: _emailController,
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              suffixIcon: Icon(
                                Icons.email_outlined,
                                size: 25,
                                color: Color(0xFF4F709C),
                              ))),
                    ),
                  ),
                  Positioned(
                    left: 50,
                    top: 12,
                    child: Container(
                      padding: const EdgeInsets.only(
                          bottom: 10, left: 10, right: 10),
                      color: Colors.white,
                      child: const Text(
                        'Enter your Email',
                        style: TextStyle(color: Colors.black, fontSize: 12),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: w * 0.05 + h * 0.05),
              OutlinedButton(
                  onPressed: () async {
                    if (isAllFieldsValid(context)) {
                      await sendResetPasswordRequest();
                    }
                  },
                  style: OutlinedButton.styleFrom(
                    backgroundColor: const Color(0xFF323B60),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    fixedSize: Size(w * 0.6, h * 0.07),
                    side: const BorderSide(
                      width: 2,
                      color: Colors.white54,
                      style: BorderStyle.solid,
                    ),
                  ),
                  child: Text(
                    "Send Verification Email",
                    style: GoogleFonts.workSans(
                        fontSize: fontSize,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        decoration: TextDecoration.none),
                    textAlign: TextAlign.center,
                  )),
              SizedBox(height: w * 0.05 + h * 0.05),
              isResendDisabled
                  ? TimerBuilder.periodic(const Duration(seconds: 1),
                      builder: (context) {
                      final remainingSeconds = resendTimer;
                      return Text(
                        'Resend in ${remainingSeconds}s',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Work Sans',
                              color: const Color(0xFF323B60),
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                      );
                    })
                  : const SizedBox(),
              SizedBox(height: w * 0.05 + h * 0.05),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const Signup()),
                    );
                  },
                  child: RichText(
                    text: TextSpan(
                        text: "Don't have an Account\t",
                        style: GoogleFonts.workSans(
                          fontSize: fontSize,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF4F709C),
                          decoration: TextDecoration.none,
                        ),
                        children: [
                          TextSpan(
                            text: "Signup",
                            style: GoogleFonts.workSans(
                                fontSize: fontSize,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xFF323B60),
                                decoration: TextDecoration.none),
                          )
                        ]),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
