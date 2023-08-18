// ignore_for_file: avoid_print, unused_field, unused_local_variable, prefer_typing_uninitialized_variables, unused_element

import 'dart:convert';

import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:login_niche2/API/API.dart';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:image_picker/image_picker.dart';
import 'package:login_niche2/API/model.dart';
import 'package:login_niche2/BUYER/buyerNavbar/navbar_buyer.dart';
import 'package:login_niche2/BUYER/buyerProfile1/buyer_profile_screen.dart';
import 'package:login_niche2/SELLER/sellerProfile/seller_profile.dart';
import 'package:login_niche2/utils/helperFunctions.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key, required this.role}) : super(key: key);
  final String role;
  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  List<User>? lister;
  File? imageFile;
  final _api = API();
  final ImagePicker picker = ImagePicker();
  final TextEditingController role = TextEditingController(),
      firstname = TextEditingController(),
      lastname = TextEditingController(),
      username = TextEditingController(),
      email = TextEditingController(),
      password = TextEditingController(),
      phone = TextEditingController(),
      address = TextEditingController(),
      city = TextEditingController(),
      state = TextEditingController(),
      zip = TextEditingController(),
      bio = TextEditingController();

  // Future getImage(ImageSource media) async {
  //   var img = await picker.pickImage(source: media);

  //   setState(() {
  //     print("Helooooooooooooooooooooooooooooooooooooo");
  //     imageFile = img;
  //   });
  // }

  @override
  void initState() {
    print("helooooooooooooo465654545");

    super.initState();
    getapidata();
    print("helooooooooooooo465654545");
    // print(lister![0].profilePicture);
  }

  Future<void> updateProfile() async {
    print("hello");
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String authToken = prefs.getString('token') ?? '';

      dio.FormData formData = dio.FormData();

      Map<String, String> fields = {
        'username': username.text,
        'email': email.text,
        'first_name': firstname.text,
        'last_name': lastname.text,
        'bio': bio.text,
        'user_phone': phone.text,
        'user_address': address.text,
        'user_city': city.text,
        'user_state': state.text,
        'user_country': lister![0].userCountry,
        'user_zipcode': zip.text,
      };

      fields.forEach((key, value) {
        if (value.isNotEmpty) {
          formData.fields.add(MapEntry(key, value));
        }
      });
      if (imageFile != null)
        formData.files.add(MapEntry(
          'image',
          await dio.MultipartFile.fromFile(imageFile!.path),
        ));

      dio.Dio dioInstance = dio.Dio();
      dioInstance.options.headers['token'] = authToken;

      dio.Response response = widget.role == "buyer"
          ? await dioInstance.put(
              _api.updatebuyer,
              data: formData,
            )
          : await dioInstance.put(
              _api.updateseller,
              data: formData,
            );

      if (response.statusCode == 200) {
        print('Profile updated successfully');
        // ignore: use_build_context_synchronously
        successPopUp(context, 'Profile Updated',
            'Your profile has been successfully updated', 'success.json', () {
          if (widget.role == "seller") {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const Seller_Profile()));
          } else {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const NavbarBuyer()));
          }
        });
      } else {
        print('Error updating profile: ${response.data}');
      }
    } catch (error) {
      print('Error: $error');
    }
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

    final API _api = API();
    Widget form(TextEditingController control, String hint, String heading,
        bool enable) {
      return Stack(
        children: <Widget>[
          Container(
            width: w * 0.9,
            height: h * 0.07,
            margin: const EdgeInsets.fromLTRB(20, 20, 20, 10),
            padding: const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFF4F709C), width: 1),
              borderRadius: BorderRadius.circular(10),
              shape: BoxShape.rectangle,
            ),
            child: Padding(
              padding: const EdgeInsets.only(right: 3, top: 3, left: 25),
              child: TextField(
                  enabled: enable,
                  controller: control,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: hint,
                      hintStyle: GoogleFonts.workSans(
                          fontSize: fonte,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF4F709C),
                          decoration: TextDecoration.none),
                      suffixIcon: const Icon(
                        Icons.person_outline,
                        size: 25,
                        color: Color(0xFF4F709C),
                      ))),
            ),
          ),
          Positioned(
            left: 35,
            top: 12,
            child: Container(
              padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
              color: Colors.white,
              child: Text(
                heading,
                style: GoogleFonts.workSans(
                    fontSize: fonte,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF4F709C),
                    decoration: TextDecoration.none),
              ),
            ),
          ),
        ],
      );
    }

    Widget bottomsheet() {
      return Container(
        // decoration: BoxDecoration(border:Border.all(color: Colors.red,width: 3),borderRadius: BorderRadius.circular(8)),
        height: h * 0.2,
        width: w * 0.7,
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
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.keyboard_backspace,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          tooltip: MaterialLocalizations.of(context)
                              .openAppDrawerTooltip,
                        ),
                        Text(
                          "Edit Profile",
                          style: GoogleFonts.dmSans(
                              fontSize: fontSize,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF323B60),
                              decoration: TextDecoration.none),
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.done,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          tooltip: MaterialLocalizations.of(context)
                              .openAppDrawerTooltip,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                    child: CircleAvatar(
                      radius: h * 0.05 + w * 0.05,
                      backgroundColor: Colors.blue,
                      backgroundImage: imageFile != null
                          ? FileImage(File(imageFile!.path))
                          : lister![0].profilePicture.isNotEmpty
                              ? NetworkImage((_api.baseURL +
                                      lister![0].profilePicture.toString())
                                  .replaceAll(word[3], word[6]))
                              : AssetImage('assets/person.png')
                                  as ImageProvider, // Use 'as ImageProvider' to explicitly cast
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: CircleAvatar(
                          radius: h * 0.018 + w * 0.018,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            radius: h * 0.015 + w * 0.015,
                            child: IconButton(
                              icon: const Icon(
                                Icons.linked_camera_outlined,
                                color: Colors.white,
                                weight: 100,
                              ),
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
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  form(role, lister![0].role.toString(), "Role", false),
                  form(firstname, lister![0].firstName.toString(), "First Name",
                      true),
                  form(lastname, lister![0].lastName.toString(), "Last Name",
                      true),
                  form(username, lister![0].username.toString(), "User Name",
                      true),
                  form(email, lister![0].email.toString(), "Email", false),
                  form(password, "********", "Password", false),
                  form(phone, lister![0].userPhone.toString(), "Phone Number",
                      true),
                  form(address, lister![0].userAddress.toString(), "Address",
                      true),
                  form(city, lister![0].userCity.toString(), "City", true),
                  form(state, lister![0].userState.toString(), "State", true),
                  form(zip, lister![0].userZipcode.toString(), "ZipCode", true),
                  lister![0].bio != null
                      ? form(bio, lister![0].bio.toString(), "Your Bio", true)
                      : form(bio, " ", "Your Bio", true),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, top: 20, bottom: 5),
                    child: Container(
                      width: Get.width * 1,
                      height: Get.height * 0.06,
                      decoration: BoxDecoration(
                        // border: Border.all(width: 3.0),R
                        borderRadius: BorderRadius.circular(8),
                        color: const Color(0xFF4F709C),
                      ),
                      child: TextButton(
                        onPressed: () async {
                          // print(imageFile!.path);
                          // print("Image URL");
                          await updateProfile();
                          // print(firstname);
                        },
                        child: Text(
                          "Confirm",
                          style: GoogleFonts.dmSans(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.none),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          : Container(color: Colors.red),
    );
  }

  Future<void> getapidata() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String authToken = prefs.getString('token') ?? '';
    print(authToken);
    String url = "http://192.168.0.106:3000/Buyer";

    //  widget.role == "buyer" ? _api.viewbuyer : _api.vieweseller;

    var result = await http.get(Uri.parse(url), headers: {'Token': authToken});
    print(result.body);
    lister = await jsonDecode(result.body)
        .map((item) => User.fromJson(item))
        .toList()
        .cast<User>();
    print(lister);

    setState(() {});
  }
}
