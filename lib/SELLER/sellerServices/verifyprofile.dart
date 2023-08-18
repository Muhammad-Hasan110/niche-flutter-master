import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:login_niche2/SELLER/sellerServices/services.dart';

class VerifyProfile extends StatefulWidget {
  const VerifyProfile({super.key});

  @override
  State<VerifyProfile> createState() => _VerifyProfileState();
}

class _VerifyProfileState extends State<VerifyProfile> {
  File? imageFile;
  final ImagePicker picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    String word = "aaa\\aa/";

    var height;

    var fonte = 14.0;
    var fontSize = 18.0;
    if (Get.width <= 389) {
      fontSize = 16.0;
      fonte = 12.0;
    } else if (Get.width > 420 && Get.width <= 960) {
      fontSize = 20.0;
      fonte = 16.0;
    } else if (Get.width > 380 && Get.width <= 420) {
      fontSize = 18.0;
      fonte = 14.0;
    } else {
      fontSize = 22.0;
      fonte = 18.0;
    }
    Widget bottomsheet() {
      return Container(
        // decoration: BoxDecoration(border:Border.all(color: Colors.red,width: 3),borderRadius: BorderRadius.circular(8)),
        height: Get.height * 0.2,
        width: Get.width * 0.7,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            Text(
              "Choose Profile Photo",
              style: GoogleFonts.dmSans(
                  fontSize: fontSize,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF323B60),
                  decoration: TextDecoration.none),
            ),
            SizedBox(
              height: h * 0.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    IconButton(
                      onPressed: () => getImage(ImageSource.camera),
                      icon: const Icon(Icons.camera_alt),
                      tooltip: "Camera",
                      iconSize: h * 0.04 + w * 0.04,
                    ),
                    const Text("Camera")
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      onPressed: () => getImage(ImageSource.gallery),
                      icon: const Icon(Icons.image),
                      tooltip: "Gallery",
                      iconSize: h * 0.04 + w * 0.04,
                    ),
                    const Text("Gallery")
                  ],
                )
              ],
            )
          ],
        ),
      );
    }

    return DefaultTabController(
      length: 2,
      child: SafeArea(
          child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Services()),
              );
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          title: Text(
            "Verify Your Profile",
            style: TextStyle(color: Colors.black),
          ),
          bottom: const TabBar(
              indicatorColor: Color(0xFF4F709C),
              indicatorPadding: EdgeInsets.only(bottom: 10, left: 10),
              indicatorWeight: 2,
              tabs: [
                Tab(
                  child: Text("ID CARD",
                      style: TextStyle(color: Color(0xFF6440FE))),
                ),
                Tab(
                  child: Text("YOUR PICTURE",
                      style: TextStyle(color: Color(0xFF6440FE))),
                ),
              ]),
        ),
        body: TabBarView(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: Get.height * 0.02),
              imageFile != null
                  ? Image(
                      image: FileImage(File(imageFile!.path), scale: 1),
                      width: Get.width * 0.8,
                      height: 200,
                      fit: BoxFit.fill,
                    )
                  : Image(
                      image: AssetImage(
                        "assets/idcard.png",
                      ),
                      width: double.infinity,
                      height: 200,
                    ),
              Column(
                children: [
                  Text(
                    "Hey TOM!",
                    style: GoogleFonts.workSans(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF323B60),
                      decoration: TextDecoration.none,
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Please Provide a Photo of the\nfront of your ID card/Driving Liscence",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.workSans(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF323B60),
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: Container(
                      width: Get.width,
                      height: Get.height * 0.06,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color(0xFF4F709C),
                      ),
                      child: TextButton(
                        onPressed: () {
                          showModalBottomSheet(
                            backgroundColor: const Color(0xFFCEB290),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            context: context,
                            builder: (builder) => bottomsheet(),
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.person),
                            Text(
                              "Photo of ID card",
                              style: GoogleFonts.dmSans(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.none,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: Get.height * 0.1),
              CircleAvatar(
                radius: h * 0.06 + w * 0.06,
                backgroundImage:
                    imageFile != null ? FileImage(File(imageFile!.path)) : null,
                child: imageFile != null
                    ? Align(
                        alignment: Alignment.bottomRight,
                        child: CircleAvatar(
                          radius: h * 0.018 + w * 0.018,
                          child: CircleAvatar(
                            radius: h * 0.015 + w * 0.015,
                            child: const Icon(
                              Icons.image,
                              color: Colors.white,
                            ),
                            backgroundColor: Colors.transparent,
                          ),
                        ),
                      )
                    : const Icon(
                        Icons.camera_alt_outlined,
                        size: 50,
                      ),
              ),
              Column(
                children: [
                  Text(
                    "Hey TOM!",
                    style: GoogleFonts.workSans(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF323B60),
                      decoration: TextDecoration.none,
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Finally we just need a \nselfie of you straight on.",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.workSans(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF323B60),
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: Container(
                      width: Get.width,
                      height: Get.height * 0.06,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color(0xFF4F709C),
                      ),
                      child: TextButton(
                        onPressed: () {
                          showModalBottomSheet(
                            backgroundColor: const Color(0xFFCEB290),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            context: context,
                            builder: (builder) => bottomsheet(),
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.person),
                            Text(
                              "Photo of a selfie",
                              style: GoogleFonts.dmSans(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.none,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ]),
      )),
    );
  }

  Future getImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);

    setState(() {
      if (img != null) {
        print(img.path);

        // If running in Flutter environment, use XFile
        imageFile = File(img.path);
      }
    });
  }
}
