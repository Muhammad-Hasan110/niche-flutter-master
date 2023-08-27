// ignore_for_file: file_names, depend_on_referenced_packages, avoid_print, use_build_context_synchronously

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:login_niche2/API/model.dart';
import 'package:login_niche2/BUYER/buyerNavbar/navbar_buyer.dart';
import 'package:login_niche2/SELLER/sellerNavbar/seller_navbar.dart';
import 'package:login_niche2/utils/helperFunctions.dart';
import 'package:login_niche2/verification/verification_Screen.dart';

import 'package:shared_preferences/shared_preferences.dart';

class API {
  final baseURL = 'http://192.168.0.106:3000/';
  // final updatebuyer = 'http://192.168.0.102:3000/buyer/';
  // final updateseller = 'http://192.168.0.102:3000/seller/updateprofile';
  // final vieweseller = 'http://192.168.0.102:3000/seller/viewprofile';
  // final viewbuyer = 'http://192.168.0.102:3000/buyer/';

  // final signupURL = 'http://192.168.0.105:3000/signup/user';
  // final resendVerificationURL = 'http://192.168.0.105:3000/verify/resend';
  // final resetPasswordURL =
  // 'http://192.168.0.105:3000/user/resetpassword?email=';

  Future<void> login(BuildContext context, email, password) async {
    try {
      final url = Uri.parse('${baseURL}login/user');
      final headers = {'Content-Type': 'application/json'};
      final body = jsonEncode({'email': email, 'password': password});
      print("ajkbakjf");
      final response = await http.post(url, headers: headers, body: body);
      print("ajkbakjf");

      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        print(response.body);
// Save email and password in shared preferences
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('userEmail', email);
        prefs.setString('userPassword', password);
        prefs.setString('token', responseData['token']);
        prefs.setString('role', responseData['role']);
        //prefs.setInt('id', responseData['id']);

        if (responseData['message'] == "User not found") {
          showSnackBar(context, 'Invalid password/Email');
          return;
        } else if (responseData['message'] == 'Account not verified') {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => VerificationScreen(
                email: email,
              ),
            ),
          );
        } else if (responseData['role'] == 'buyer') {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const NavbarBuyer()),
          );
        } else if (responseData['role'] == 'seller') {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const NavbarSeller()),
          );
        }
      } else {
        throw Exception('Failed to login');
      }
    } catch (error) {
      const errorMessage = 'An error occurred while logging in.';
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
            title: const Text(
              'Login Failed',
              style: TextStyle(
                color: Color.fromRGBO(33, 53, 85, 1.0),
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            content: const Text(
              errorMessage,
              style: TextStyle(
                color: Color.fromRGBO(33, 53, 85, 1.0),
                fontSize: 16,
              ),
            ),
            actions: [
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: const Color.fromRGBO(33, 53, 85, 1.0),
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
  }

  Future<List<SubCategory>> getsubcategory(String parentid) async {
    try {
      print(parentid);
      String url = "${baseURL}Category/$parentid";
      var result = await http.get(Uri.parse(url));
      print(result.body);
      final subcategory = (jsonDecode(result.body) as List)
          .map((item) => SubCategory.fromJson(item))
          .toList();
      return subcategory;
    } catch (error) {
      print("Error getting subcategories: $error");
      rethrow; // Rethrow the error for upper layers to handle
    }
  }

  Future<List<Category>> getcategory() async {
    try {
      String url = "${baseURL}category";
      var result = await http.get(Uri.parse(url));
      print(result.body);
      final category = (jsonDecode(result.body) as List)
          .map((item) => Category.fromJson(item))
          .toList();
      print(category);
      return category;
    } catch (error) {
      print("Error getting categories: $error");
      rethrow; // Rethrow the error for upper layers to handle
    }
  }

  String capitalize(String input) {
    if (input.isEmpty) {
      return input; // Return unchanged if input is empty
    }
    return input[0].toUpperCase() + input.substring(1);
  }
}
