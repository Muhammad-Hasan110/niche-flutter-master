// ignore_for_file: camel_case_types, avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_niche2/API/API.dart';
import 'package:login_niche2/DataModler/seller.dart';
import 'package:login_niche2/DataModler/user.dart';
import 'package:login_niche2/SELLER/sellerNavbar/seller_navbar.dart';
import 'package:login_niche2/SELLER/sellerProfile/widgets/menuCard.dart';
import 'package:login_niche2/about/screen/aboutScreen.dart';
import 'package:login_niche2/login/login_Screen.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'editprofile.dart';

class CustomColor {
  static const Color primaryColor = Color(0xFF323B60);
  static const Color secondaryColor = Color(0xFF4F709C);
  static const Color accentColor = Color(0xFFF5EFE7);
}

class Seller_Profile extends StatefulWidget {
  const Seller_Profile({super.key});

  @override
  State<Seller_Profile> createState() => _Seller_ProfileState();
}

class _Seller_ProfileState extends State<Seller_Profile> {
  List<User>? lister;
  final _api = API();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getapidata();
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var height1;
    if (Get.width > 1200) {
      height1 = h * 0.55;
    } else {
      height1 = h * 0.4;
    }
    final w = MediaQuery.of(context).size.width;

    var fontSize = 22.0;
    var fonte = 12.0;
    if (Get.width <= 380) {
      fontSize = 22.0;
      fonte = 12;
    } else if (Get.width > 420 && Get.width <= 960) {
      fontSize = 24.0;
      fonte = 14;
    } else if (Get.width > 380 && Get.width <= 420) {
      fontSize = 26.0;
      fonte = 16;
    } else {
      fontSize = 28.0;
      fonte = 14;
    }

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          elevation: 2,
          title: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              'assets/niche.png',
              width: 123,
              height: 54,
              fit: BoxFit.fitWidth,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                print('Notification button pressed');
              },
              icon: const Icon(
                Icons.notifications_active_rounded,
                color: Color.fromARGB(255, 12, 3, 30),
                size: 30,
              ),
            ),
            IconButton(
              onPressed: () {
                print('Messages button pressed');
              },
              icon: const Icon(
                Icons.message_rounded,
                color: Color.fromARGB(255, 12, 3, 30),
                size: 30,
              ),
            ),
          ],
        ),
        body: lister != null
            ? SingleChildScrollView(
                child: Column(children: [
                  Container(
                    height: height1,
                    width: w * 1,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          CustomColor.primaryColor,
                          Colors
                              .white, // Merge with white for a smooth transition
                        ],
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: h * 0.04 + w * 0.04,
                            backgroundColor: Colors.blue,
                            child: CircleAvatar(
                              radius: h * 0.037 + w * 0.037,
                              // backgroundColor: Colors.red,
                              backgroundImage: NetworkImage(_api.baseURL +
                                  lister![0].profilePicture.toString()),
                              child: Align(
                                alignment: Alignment.bottomRight,
                                child: CircleAvatar(
                                  radius: h * 0.016 + w * 0.016,
                                  child: IconButton(
                                    icon: const Icon(
                                      Icons.edit_sharp,
                                      color: Colors.black,
                                      weight: 10,
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const EditProfile(
                                                      role: "seller")));
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            lister![0].firstName.toString() +
                                " " +
                                lister![0].lastName.toString(),
                            style: GoogleFonts.workSans(
                              fontSize: fontSize,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                              decoration: TextDecoration.none,
                            ),
                          ),
                          SizedBox(height: h * 0.001),
                          Text(
                            lister![0].email.toString(),
                            style: GoogleFonts.workSans(
                              fontSize: fonte,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                              decoration: TextDecoration.none,
                            ),
                          ),
                          SizedBox(height: h * 0.02),
                          SizedBox(
                            width: w * 0.855,
                            height: h * 0.15,
                            child: Material(
                              elevation:
                                  4, // Adjust elevation as needed for the desired shadow effect
                              borderRadius: BorderRadius.circular(10),
                              color: CustomColor
                                  .primaryColor, // Use primary color directly
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "259+",
                                          style: GoogleFonts.workSans(
                                            fontSize: fontSize,
                                            fontWeight: FontWeight.w400,
                                            color: Colors
                                                .white, // Text color is white
                                            decoration: TextDecoration.none,
                                          ),
                                        ),
                                        Text(
                                          "Service Delivered",
                                          style: GoogleFonts.workSans(
                                            fontSize: fonte,
                                            fontWeight: FontWeight.w400,
                                            color: Colors
                                                .white, // Text color is white
                                            decoration: TextDecoration.none,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Divider(
                                    color:
                                        Colors.white, // Divider color is white
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "05+",
                                          style: GoogleFonts.workSans(
                                            fontSize: fontSize,
                                            fontWeight: FontWeight.w400,
                                            color: Colors
                                                .white, // Text color is white
                                            decoration: TextDecoration.none,
                                          ),
                                        ),
                                        Text(
                                          "Years of Experience",
                                          style: GoogleFonts.workSans(
                                            fontSize: fonte,
                                            fontWeight: FontWeight.w400,
                                            color: Colors
                                                .white, // Text color is white
                                            decoration: TextDecoration.none,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: h * 0.05),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 20),
                    child: Column(
                      children: [
                        MenuTile(
                            title: "App Language",
                            icon: Icons.language,
                            fonte: fonte),
                        MenuTile(
                            title: "App Theme",
                            icon: Icons.dark_mode,
                            fonte: fonte),
                        MenuTile(
                            title: "Change Password",
                            icon: Icons.lock_reset,
                            fonte: fonte),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AboutScreen()),
                            );
                          },
                          child: MenuTile(
                              title: "About Us",
                              icon: Icons.info,
                              fonte: fonte),
                        ),
                        MenuTile(
                            title: "Earning List",
                            icon: Icons.list,
                            fonte: fonte),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const LoginScreen()),
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextButton(
                                  onPressed: () async {
                                    SharedPreferences prefs =
                                        await SharedPreferences.getInstance();
                                    prefs.remove('userEmail');
                                    prefs.remove('userPassword');
                                    prefs.remove('token');
                                    prefs.remove('role');
                                    prefs.remove('id');
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const LoginScreen()),
                                    );
                                  },
                                  child: Text(
                                    "Logout",
                                    style: GoogleFonts.workSans(
                                      fontSize: fonte,
                                      fontWeight: FontWeight.w600,
                                      color: const Color(0xFF4F709C),
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ]),
              )
            : Container());
  }

  Future<void> getapidata() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String authToken = prefs.getString('token') ?? '';
    String url = "${_api.vieweseller}";

    var result = await http.get(Uri.parse(url), headers: {'Token': authToken});
    print(result.body);
    lister = jsonDecode(result.body)
        .map((item) => User.fromJson(item))
        .toList()
        .cast<User>();
    setState(() {});
  }
}
