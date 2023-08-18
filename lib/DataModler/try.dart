import 'dart:convert';
import 'dart:ffi';
import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:login_niche2/DataModler/category.dart';
import 'package:login_niche2/DataModler/subcategory.dart';
import 'package:login_niche2/SELLER/SellerHome/widgets/serviceCard.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  List<SubCategory>? _subcategory;
  List<Category>? _category;
  bool check = false;
  var selectedSubcategoryName;
  var selectedcategoryName;
  var parentid;

  Map<String, dynamic> updates = {
    'user_id': 123464,
    'username': 'hasan123',
    'email': 'waizbinqasim0@gmail.com',
    'first_name': 'hasan',
    'last_name': 'Doe',
    'bio': 'I am a software engineer.',
    'registration_date': '2023-08-02 19:00:00.000Z',
    'role': 'seller',
    'user_phone': '03322630758',
    'user_address': '123 Main Street',
    'user_city': 'New York',
    'user_state': 'NY',
    'user_country': 'USA',
    'user_zipcode': '10001',
  };

  // Replace with the actual image file if needed
  File? imageFile = File(
      'http://192.168.0.105:3000/Images/Seller/1691312717747-381581740.jpeg');

  @override
  void initState() {
    super.initState();
    // getcategory();
    updateprofile(updates, imageFile);

    print("heloooooooooooooooooooooooooooooooooo");
    // print(lister![0].serviceImage);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: _category != null && check == false
                ? Column(
                    children: [category(), hidden()],
                  )
                : check == true && _subcategory != null
                    ? Column(
                        children: [category(), subcategory()],
                      )
                    : Container()));
  }

  Widget category() {
    print(check);
    print("bbbbbbbbbbbbbbb111111111");
    selectedcategoryName = _category![0].categoryName.toString();
    return DropdownButtonFormField<String>(
      isExpanded: true,
      hint: Text(
        "Select a category",
        style: TextStyle(
          color: Colors.black54,
          fontSize: 15,
        ),
      ),
      value: selectedcategoryName, // Use a String as the selected value
      icon: Icon(
        Icons.keyboard_arrow_down,
        color: Colors.black54,
      ),
      style: TextStyle(
        fontSize: 15,
        color: Colors.black,
      ),
      decoration: InputDecoration(
        border: InputBorder.none,
        filled: true,
        fillColor: Colors.white,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
      ),
      items: _category!.map((category) {
        return DropdownMenuItem<String>(
          value: category.categoryName ??
              '', // Use the categoryName string as the value
          child: Text(
            category.categoryName ?? '',
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
          ),
        );
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          print(check);
          selectedcategoryName = newValue!;
          print(selectedcategoryName);
          // Access the selected categoryName

          print(check);
          print("old parent id= $parentid");

          num(selectedcategoryName);
          print("new parent id= $parentid");
          check = true;
          parentid != null ? getsubcategory() : null;
        });
      },
    );
  }

  Widget subcategory() {
    print(check);
    print("bbbbbbbbbbbbbbb111111111");
    selectedSubcategoryName = _subcategory![0].subCategoryName.toString();
    return DropdownButtonFormField<String>(
      isExpanded: true,
      hint: Text(
        "Select a category",
        style: TextStyle(
          color: Colors.black54,
          fontSize: 15,
        ),
      ),
      value: selectedSubcategoryName, // Use a String as the selected value
      icon: Icon(
        Icons.keyboard_arrow_down,
        color: Colors.black54,
      ),
      style: TextStyle(
        fontSize: 15,
        color: Colors.black,
      ),
      decoration: InputDecoration(
        border: InputBorder.none,
        filled: true,
        fillColor: Colors.white,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
      ),
      items: _subcategory!.map((category) {
        return DropdownMenuItem<String>(
          value: category.subCategoryName ??
              '', // Use the categoryName string as the value
          child: Text(
            category.subCategoryName ?? '',
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
          ),
        );
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          // check = check;
          print(check);
          selectedSubcategoryName = newValue!;
          print(selectedSubcategoryName); // Access the selected categoryName

          print(check);
        });
      },
    );
  }

  Widget hidden() {
    print(check);
    print("bbbbbbbbbbbbbbb111111111");
    selectedSubcategoryName = "haircut";
    return DropdownButtonFormField<String>(
        enableFeedback: false,
        isExpanded: true,
        hint: Text(
          "Select a subcategory",
          style: TextStyle(
            color: Colors.black54,
            fontSize: 15,
          ),
        ),
        value: null, // Use a String as the selected value
        icon: Icon(
          Icons.keyboard_arrow_down,
          color: Colors.black54,
        ),
        style: TextStyle(
          fontSize: 15,
          color: Colors.black,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          filled: true,
          fillColor: Colors.white,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
        ),
        items: null,
        onChanged: null);
  }

  Widget form() {
    print(check);
    print("aaaaaaaaaaaaaaa55555555aaaaaaaaaaaaaaaaaa");
    return TextFormField(
      initialValue: "Haircut",
    );
  }

  Widget form2() {
    print(check);
    print("ccccccccccaaaaa");
    return TextFormField(
      initialValue: "Accounts",
    );
  }

  // getlist() {
  //   return ListView.builder(
  //       itemCount: lister!.length,
  //       itemBuilder: (BuildContext context, int index) {
  //         return ServiceCard(
  //             serviceName: lister![index].subCategoryName.toString(),
  //             serviceRatings: "4.9",
  //             serviceTime: lister![index].subCategoryId!.toInt(),
  //             servicePrice: "hellooo",
  //             serviceImage:
  //                 "http://192.168.0.105:3000/${lister![index].subCategoryImage}");
  //       });
  // }
  void num(String x) {
    print(parentid);
    print(x);

    for (int i = 0; i < _category!.length; i++) {
      if (_category![i].categoryName == x) {
        parentid = _category![i].categoryId;
        print(parentid);
      }
    }
  }

  var id = 2;
  Future<void> getsubcategory() async {
    print(parentid);
    String url = "http://192.168.0.105:3000/category/$parentid";
    var result = await http.get(Uri.parse(url));
    print(result.body);
    _subcategory = jsonDecode(result.body)
        .map((item) => SubCategory.fromJson(item))
        .toList()
        .cast<SubCategory>();
    setState(() {});
  }

  Future<void> getcategory() async {
    String url = "http://192.168.0.105:3000/category";
    var result = await http.get(Uri.parse(url));
    print(result.body);
    _category = jsonDecode(result.body)
        .map((item) => Category.fromJson(item))
        .toList()
        .cast<Category>();
    setState(() {});
  }

  Future<void> updateprofile(
      Map<String, dynamic> updates, File? imageFile) async {
    try {
      String apiUrl =
          'http://192.168.0.105:3000/seller/updateprofile'; // Update with your API URL
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String authToken = prefs.getString('token') ?? '';

      dio.Dio dioInstance = dio.Dio();

      //String authToken = 'your-auth-token-here'; // Replace with your actual auth token
      dioInstance.options.headers['token'] = authToken;

      dio.FormData formData = dio.FormData.fromMap(updates);

      if (imageFile != null) {
        formData.files.add(MapEntry(
          'profile_picture',
          await dio.MultipartFile.fromFile(imageFile.path),
        ));
      }

      dio.Response response = await dioInstance.put(apiUrl, data: formData);

      if (response.statusCode == 200) {
        print('Profile updated successfully');
        // Handle success, e.g., show a success message or navigate to a new screen
      } else {
        print('Error updating profile: ${response.data}');
        // Handle error, e.g., show an error message
      }
    } catch (error) {
      print('Error: $error');
      // Handle error, e.g., show an error message
    }
  }

// Usage
}
