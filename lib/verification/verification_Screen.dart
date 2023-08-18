// ignore_for_file: file_names, depend_on_referenced_packages, library_private_types_in_public_api, avoid_print, deprecated_member_use

import 'dart:async';

import 'package:login_niche2/API/API.dart';
import 'package:login_niche2/login/login_Screen.dart';
import 'package:login_niche2/utils/flutterflow/flutter_flow_theme.dart';
import 'package:login_niche2/utils/flutterflow/flutter_flow_util.dart';
import 'package:login_niche2/utils/flutterflow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:timer_builder/timer_builder.dart';
import 'package:http/http.dart' as http;
import 'verification_model.dart';
export 'verification_model.dart';

class VerificationScreen extends StatefulWidget {
  final String email;

  const VerificationScreen({Key? key, required this.email}) : super(key: key);

  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  late VerificationModel _model;
  bool isResendDisabled = false;
  int resendTimer = 30;
  int tempTimer = 30;
  Timer? _timer;
  final api = API();

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VerificationModel());
  }

  @override
  void dispose() {
    _model.dispose();
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

  Future<void> resendVerificationEmail() async {
    final url = Uri.parse('${api.baseURL}verify/resend');
    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode({'email': widget.email});

    try {
      final response = await http.post(url, headers: headers, body: body);

      if (response.statusCode == 200) {
        print('Verification email has been resent successfully');
        showResendFailedDialog('Resend Succesfull',
            'Verification email has been resent successfully');
        startResendTimer();
      } else {
        print(
            'Failed to resend verification email. Status code: ${response.statusCode}');
        showResendFailedDialog('Resend Failed',
            'Failed to resend verification email. Please try again.');
      }
    } catch (e) {
      print('Error occurred while resending verification email: $e');
      showResendFailedDialog('Resend Failed',
          'An error occurred while resending verification email. Please try again later.');
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
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight,
                  ),
                  child: IntrinsicHeight(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: 50),
                          const FaIcon(
                            FontAwesomeIcons.envelopeOpen,
                            color: Color(0xFF323B60),
                            size: 70,
                          ),
                          const SizedBox(height: 20),
                          Text(
                            'Verify your email address',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Work Sans',
                                  color: const Color(0xFF323B60),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            'We have just sent an email verification link to your email. Please check your email and click on the link to verify your email address.',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Work Sans',
                                  color: const Color(0xFF4F709C),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                          const Spacer(),
                          FFButtonWidget(
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) => const LoginScreen(),
                                ),
                              );
                            },
                            text: 'Continue to Login',
                            options: FFButtonOptions(
                              width: constraints.maxWidth * 0.8,
                              height: 60,
                              padding: EdgeInsets.zero,
                              iconPadding: EdgeInsets.zero,
                              color: const Color(0xFF4F709C),
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color: Colors.white,
                                  ),
                              elevation: 3,
                              borderSide: const BorderSide(
                                color: Color(0xFF323B60),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          const SizedBox(height: 10),
                          FFButtonWidget(
                            onPressed: isResendDisabled
                                ? null
                                : resendVerificationEmail,
                            text: 'Resend E-Mail Link',
                            options: FFButtonOptions(
                              width: constraints.maxWidth * 0.8,
                              height: 60,
                              padding: EdgeInsets.zero,
                              iconPadding: EdgeInsets.zero,
                              color: Colors.white,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color: const Color(0xFF4F709C),
                                  ),
                              elevation: 3,
                              borderSide: const BorderSide(
                                color: Color(0xFF323B60),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          const SizedBox(height: 20),
                          isResendDisabled
                              ? TimerBuilder.periodic(
                                  const Duration(seconds: 1),
                                  builder: (context) {
                                  final remainingSeconds = resendTimer;
                                  return Text(
                                    'Resend in ${remainingSeconds}s',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Work Sans',
                                          color: const Color(0xFF323B60),
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  );
                                })
                              : const SizedBox(),
                          const SizedBox(height: 40),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
