// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_niche2/login/login_Screen.dart';
import 'package:login_niche2/signup/signup.dart';

class SplashScreenWidget extends StatelessWidget {
  final String imageAsset;
  final String text;
  final int inkwellIndex;
  final VoidCallback onForwardPressed;
  final VoidCallback onBackwardPressed;

  const SplashScreenWidget({
    Key? key,
    required this.imageAsset,
    required this.text,
    required this.inkwellIndex,
    required this.onForwardPressed,
    required this.onBackwardPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: AssetImage(imageAsset),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          color: Colors.black.withOpacity(0.5),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final width = constraints.maxWidth;
              final height = constraints.maxHeight;

              return Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    SizedBox(
                      height: height * 0.4,
                      width: width,
                    ),
                    SizedBox(
                      height: height * 0.1,
                      width: width,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: onBackwardPressed,
                            icon: const Icon(Icons.arrow_back),
                            color: Colors.white,
                          ),
                          IconButton(
                            onPressed: onForwardPressed,
                            icon: const Icon(Icons.arrow_forward),
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      child: SizedBox(
                        height: height * 0.3,
                        width: width,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            text,
                            style: GoogleFonts.dmSans(
                              fontSize: height * 0.035,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          for (int i = 1; i <= 4; i++)
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircleAvatar(
                                radius: 5,
                                backgroundColor: i == inkwellIndex
                                    ? Colors.black
                                    : Colors.grey,
                              ),
                            ),
                          // You can add more CircleAvatar widgets here based on the number of inkwells you want to display
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                          ),
                          child: OutlinedButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginScreen(),
                                ),
                              );
                            },
                            style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              fixedSize: Size(width * 0.4, height * 0.06),
                              side: const BorderSide(
                                width: 2,
                                color: Colors.white54,
                                style: BorderStyle.solid,
                              ),
                            ),
                            child: Text(
                              "LOGIN",
                              style: GoogleFonts.dmSans(
                                fontSize: height * 0.02,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                decoration: TextDecoration.none,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: width * 0.03,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: OutlinedButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Signup(),
                                ),
                              );
                            },
                            style: OutlinedButton.styleFrom(
                              backgroundColor: const Color(0xFFCEB290),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              fixedSize: Size(width * 0.4, height * 0.06),
                              side: const BorderSide(
                                width: 2,
                                color: Color(0xFFCEB290),
                                style: BorderStyle.solid,
                              ),
                            ),
                            child: Text(
                              "Get Started",
                              style: GoogleFonts.dmSans(
                                fontSize: height * 0.02,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFF323B60),
                                decoration: TextDecoration.none,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
