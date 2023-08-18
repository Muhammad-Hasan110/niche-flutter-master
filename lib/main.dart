import 'package:flutter/material.dart';
import 'package:login_niche2/SELLER/sellerServices/add_service.dart';
import 'package:login_niche2/SELLER/sellerServices/edit_service.dart';
import 'package:login_niche2/SplashScreen/Splash_Screen.dart';
import 'package:login_niche2/about/screen/aboutScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:login_niche2/BUYER/buyerNavbar/navbar_buyer.dart';
import 'package:login_niche2/SELLER/sellerNavbar/seller_navbar.dart';
import 'package:login_niche2/login/login_screen.dart'; // Import your LoginScreen class
import 'package:loading_animation_widget/loading_animation_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String route = '';
  bool isFirstTime = true; // Initialize to true by default

  @override
  void initState() {
    super.initState();
    _checkFirstTime();
  }

  Future<void> _checkFirstTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool firstTime = prefs.getBool('firstTime') ?? true;
    print(firstTime);
    setState(() {
      isFirstTime = firstTime;
    });

    if (!isFirstTime) {
      _navigateBasedOnRole();
    } else {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool('firstTime', false);
    }
  }

  Future<void> _navigateBasedOnRole() async {
    Future.delayed(const Duration(seconds: 2), () async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String role = prefs.getString('role') ?? '';
      if (role == 'buyer') {
        setState(() {
          route = 'buyer';
        });
      } else if (role == 'seller') {
        setState(() {
          route = 'seller';
        });
      } else {
        setState(() {
          route = 'login';
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    if (isFirstTime) {
      // Show splash screen here
      return const MaterialApp(
        home: SplashScreen(), // Replace with your splash screen widget
      );
    } else {
      // Your navigation logic remains the same
      return MaterialApp(
        home: Scaffold(
          body: route == 'buyer'
              ? const NavbarBuyer()
              : route == 'seller'
                  ? const NavbarSeller()
                  : route == 'login'
                      ? const LoginScreen()
                      : Center(
                          child: LoadingAnimationWidget.discreteCircle(
                            color: Colors.blueAccent,
                            size: screenWidth * 0.34,
                            secondRingColor: Colors.brown.shade400,
                            thirdRingColor: Colors.purple,
                          ),
                        ),
        ),
      );
    }
  }
}
