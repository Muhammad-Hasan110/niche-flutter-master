// ignore_for_file: depend_on_referenced_packages, avoid_print, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:login_niche2/API/API.dart';
import 'package:login_niche2/login/login_Screen.dart';
import 'package:login_niche2/signup/widgets/labelTextField.dart';
import 'package:login_niche2/verification/verification_Screen.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  String dropdownvalueRole = 'Buyer';
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController userAddress = TextEditingController();
  TextEditingController userCity = TextEditingController();
  TextEditingController userState = TextEditingController();
  TextEditingController userCountry = TextEditingController();
  TextEditingController userZipcode = TextEditingController();
  TextEditingController userPhone = TextEditingController();
  final api = API();
  @override
  Widget build(BuildContext context) {
    bool isEmailValid(String email) {
      // Implement your email validation logic here
      // Example implementation using RegExp:
      return RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
          .hasMatch(email);
    }

    bool isPhoneNumberValid(String phoneNumber) {
      // Implement your phone number validation logic here
      // Example implementation using RegExp:
      return RegExp(r'^\+?[0-9]{8,}$').hasMatch(phoneNumber);
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
      if (username.text.isEmpty) {
        showSnackBar(context, 'Username is required');
        return false;
      }

      if (email.text.isEmpty) {
        showSnackBar(context, 'Email is required');
        return false;
      }

      if (!isEmailValid(email.text)) {
        showSnackBar(context, 'Invalid email');
        return false;
      }

      if (password.text.isEmpty) {
        showSnackBar(context, 'Password is required');
        return false;
      }

      if (firstName.text.isEmpty) {
        showSnackBar(context, 'First name is required');
        return false;
      }

      if (lastName.text.isEmpty) {
        showSnackBar(context, 'Last name is required');
        return false;
      }

      if (dropdownvalueRole.isEmpty) {
        showSnackBar(context, 'Role is required');
        return false;
      }

      if (userAddress.text.isEmpty) {
        showSnackBar(context, 'User address is required');
        return false;
      }

      if (userCity.text.isEmpty) {
        showSnackBar(context, 'User city is required');
        return false;
      }

      if (userState.text.isEmpty) {
        showSnackBar(context, 'User state is required');
        return false;
      }

      if (userZipcode.text.isEmpty) {
        showSnackBar(context, 'User zipcode is required');
        return false;
      }

      if (userPhone.text.isEmpty) {
        showSnackBar(context, 'User phone is required');
        return false;
      }

      if (!isPhoneNumberValid(userPhone.text)) {
        showSnackBar(context, 'Invalid phone number');
        return false;
      }

      return true;
    }

    Future<void> signUp() async {
      // Replace with your API endpoint

      final usernameText = username.text;
      final emailText = email.text;
      final passwordText = password.text;
      final firstNameText = firstName.text;
      final lastNameText = lastName.text;
      final roleValue = dropdownvalueRole.toString();
      final userAddressText = userAddress.text;
      final userCityText = userCity.text;
      final userStateText = userState.text;
      final userZipcodeText = userZipcode.text;
      final userPhoneText = userPhone.text;
      print('agya m');
      final body = jsonEncode({
        // 'first_name': "firstNameText",
        // 'last_name': "lastNameText",
        // 'username': "usernameText",
        // 'email': "sharjeel@gmail.com",
        // 'password': "passwordText",
        // 'role': "seller",
        // 'user_address': "userAddressText",
        // 'user_city': "userCityText",
        // 'user_state': "userStateText",
        // 'user_country': 'Canada',
        // 'user_zipcode': "userZipcodeText",
        // 'user_phone': "userPhoneText",
        "first_name": firstNameText,
        "last_name": lastNameText,
        "username": usernameText,
        "email": emailText,
        "password": passwordText,
        "role": roleValue,
        "user_address": userAddressText,
        "user_city": userCityText,
        "user_state": userStateText,
        "user_country": "Canada",
        "user_zipcode": userZipcodeText,
        "user_phone": userPhoneText
      });

      final headers = {'Content-Type': 'application/json'};

      try {
        final response = await http.post(Uri.parse('${api.baseURL}signup/user'),
            headers: headers, body: body);

        if (response.statusCode == 200) {
          print('User created successfully');
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => VerificationScreen(
                      email: email.text,
                    )),
          );
          // Handle successful signup
        } else {
          print('Signup failed with status code ${response.statusCode}');
          // Handle signup failure
        }
      } catch (e) {
        print('Error occurred during signup: $e');
        // Handle error
      }
    }

    var fontSignup = 40.0;
    if (Get.width <= 380) {
      fontSignup = 40.0;
    } else if (Get.width > 420 && Get.width <= 960) {
      fontSignup = 50.0;
    } else if (Get.width > 380 && Get.width <= 420) {
      fontSignup = 45.0;
    } else {
      fontSignup = 65.0;
    }

    var fontLogin = 20.0;
    if (Get.width <= 380) {
      fontSignup = 20.0;
    } else if (Get.width > 420 && Get.width <= 960) {
      fontSignup = 30.0;
    } else if (Get.width > 380 && Get.width <= 420) {
      fontSignup = 25.0;
    } else {
      fontSignup = 35.0;
    }

    var items = ["Buyer", "Seller"];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(children: [
          Center(
            child: Container(
                height: Get.height * 0.23,
                width: MediaQuery.of(context).size.width * 1,
                decoration: const BoxDecoration(
                  // color: Color(0xFF323B60),
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF323B60),
                      Color.fromARGB(217, 68, 78, 116),
                      Color.fromARGB(220, 88, 98, 139),
                      Color.fromARGB(178, 255, 255, 255),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    // stops: [0.0, 0.7],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: Get.height * 0.1,
                      ),
                      Text(
                        "SignUp",
                        style: GoogleFonts.dmSans(
                            fontSize: fontSignup,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            decoration: TextDecoration.none),
                      ),
                      Row(
                        children: [
                          Text(
                            "Already have an Account?",
                            style: GoogleFonts.dmSans(
                                fontSize: fontLogin,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                decoration: TextDecoration.none),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const LoginScreen()),
                                );
                              },
                              child: Text("Login",
                                  style: GoogleFonts.dmSans(
                                      fontSize: fontLogin,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      decoration: TextDecoration.none)))
                        ],
                      ),
                    ],
                  ),
                )),
          ),
          SizedBox(
            height: Get.height * 0.01,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    offset: Offset(0, 2),
                    blurRadius: 4,
                  ),
                ],
              ),
              child: DropdownButtonFormField<String>(
                isExpanded: true,
                hint: Text(
                  "Buyer/Seller",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 15,
                  ),
                ),
                value: dropdownvalueRole,
                icon: Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.black54,
                ),
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Theme.of(context).primaryColor,
                      width: 2.0,
                    ),
                  ),
                ),
                items: items.map((String item) {
                  return DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownvalueRole = newValue!;
                  });
                },
              ),
            ),
          ),
          SizedBox(
            height: Get.height * 0.01,
          ),
          LabeledTextField(
            label: "First Name",
            hint: "John",
            controller: firstName,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          ),
          LabeledTextField(
            label: "Last Name",
            hint: "Doe",
            controller: lastName,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          ),
          LabeledTextField(
            label: "Username",
            hint: "John Doe",
            controller: username,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          ),
          LabeledTextField(
            label: "Email",
            hint: "johndoe@gmail.com",
            controller: email,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          ),
          LabeledTextField(
            label: "Password",
            hint: "********",
            controller: password,
            obscureText: true,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          ),
          LabeledTextField(
            label: "Phone Number",
            hint: "+1 415 555-2671",
            controller: userPhone,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          ),
          LabeledTextField(
            label: "Address",
            hint: "2-234 PINE ST",
            controller: userAddress,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          ),
          LabeledTextField(
            label: "City",
            hint: "Toronto",
            controller: userCity,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          ),
          LabeledTextField(
            label: "State",
            hint: "Ontario",
            controller: userState,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          ),
          LabeledTextField(
            label: "ZipCode",
            hint: "L4K",
            controller: userZipcode,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
            child: ElevatedButton(
              onPressed: () {
                // username.text = "sharjeel";
                // email.text = "sharjeelshakeelahmed@gmail.com";
                // password.text = "password123";
                // firstName.text = "John";
                // lastName.text = "Doe";
                // dropdownvalueRole = items[0];
                // userAddress.text = "123 Main St";
                // userCity.text = "New York";
                // userState.text = "NY";
                // userCountry.text = "USA";
                // userZipcode.text='12125';
                // userPhone.text = "243536353";
                // if (isAllFieldsValid(context)) {
                signUp();
                // }
              },
              style: ElevatedButton.styleFrom(
                primary:
                    Colors.blue[900], // Set the background color to navy blue
                padding: EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 4,
              ),
              child: Text(
                'Sign Up',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
