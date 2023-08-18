// ignore_for_file: file_names, avoid_print

import 'package:flutter/material.dart';
import 'package:login_niche2/SplashScreen/widgets/splashScreenWidget.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SplashScreenWidget(
        imageAsset: 'assets/splash1.png',
        text:
            'Schedule your\nAppointment with\nthe best hair stylist\nin your Town.',
        inkwellIndex: 1,
        onForwardPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SplashScreenWidget(
                imageAsset: 'assets/splash2.png',
                text:
                    "Schedule the\nAppointment in the\nbest Salon for\nyour kids.\n",
                inkwellIndex: 2,
                onForwardPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SplashScreenWidget(
                        imageAsset: 'assets/splash3.png',
                        text:
                            'Schedule your\nAppointment with\nthe best hair stylist\nin your Town.',
                        inkwellIndex: 3,
                        onForwardPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SplashScreenWidget(
                                imageAsset: 'assets/splash4.png',
                                text:
                                    "Schedule the\nAppointment in the\nbest Salon for\nyour kids.\n",
                                inkwellIndex: 4,
                                onForwardPressed: () {},
                                onBackwardPressed: () {
                                  print("asfasg");
                                  Navigator.of(context).pop();
                                },
                              ),
                            ),
                          );
                        },
                        onBackwardPressed: () {
                          print("asfasg");
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  );
                },
                onBackwardPressed: () {
                  print("asfasg");
                  Navigator.of(context).pop();
                },
              ),
            ),
          );
        },
        onBackwardPressed: () {},
      ),
    );
  }
}

