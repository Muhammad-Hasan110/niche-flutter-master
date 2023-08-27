import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:login_niche2/API/API.dart';
import 'package:login_niche2/API/model.dart';
import 'package:login_niche2/SELLER/sellerServices/services.dart';
import 'package:login_niche2/SELLER/sellerServices/widgets/stackedContainer.dart';
import 'package:login_niche2/SELLER/sellerServices/widgets/stackedDropdown.dart';
import 'package:login_niche2/utils/helperFunctions.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';

class SubCategory {
  int? subCategoryId;
  String? subCategoryName;
  int? parentId;
  String? subCategoryImage;

  SubCategory(
      {this.subCategoryId,
      this.subCategoryName,
      this.parentId,
      this.subCategoryImage});

  SubCategory.fromJson(Map<String, dynamic> json) {
    subCategoryId = json['subCategory_id'];
    subCategoryName = json['subCategory_name'];
    parentId = json['parent_id'];
    subCategoryImage = json['subCategory_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['subCategory_id'] = this.subCategoryId;
    data['subCategory_name'] = this.subCategoryName;
    data['parent_id'] = this.parentId;
    data['subCategory_image'] = this.subCategoryImage;
    return data;
  }
}

class Category {
  int? categoryId;
  String? categoryName;
  String? categoryImage;

  Category({this.categoryId, this.categoryName, this.categoryImage});

  Category.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    categoryImage = json['category_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category_id'] = this.categoryId;
    data['category_name'] = this.categoryName;
    data['category_image'] = this.categoryImage;
    return data;
  }
}

class User {
  int userId;
  String username;
  String email;
  String firstName;
  String lastName;
  String bio;
  String profilePicture;
  DateTime registrationDate;
  String role;
  String userPhone;
  String userAddress;
  String userCity;
  String userState;
  String userCountry;
  String userZipcode;

  User({
    required this.userId,
    required this.username,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.bio,
    required this.profilePicture,
    required this.registrationDate,
    required this.role,
    required this.userPhone,
    required this.userAddress,
    required this.userCity,
    required this.userState,
    required this.userCountry,
    required this.userZipcode,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userId: json['user_id'],
      username: json['username'],
      email: json['email'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      bio: json['bio'],
      profilePicture: json['profile_picture'],
      registrationDate: DateTime.parse(json['registration_date']),
      role: json['role'],
      userPhone: json['user_phone'],
      userAddress: json['user_address'],
      userCity: json['user_city'],
      userState: json['user_state'],
      userCountry: json['user_country'],
      userZipcode: json['user_zipcode'],
    );
  }
}
