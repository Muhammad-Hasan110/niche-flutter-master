// ignore_for_file: use_build_context_synchronously, unnecessary_null_comparison

import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as https;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';
import 'package:login_niche2/API/API.dart';
import 'package:login_niche2/API/model.dart';
import 'package:login_niche2/SELLER/sellerServices/widgets/stackedContainer.dart';
import 'package:login_niche2/SELLER/sellerServices/widgets/stackedDropdown.dart';
import 'package:login_niche2/utils/helperFunctions.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stylish_dialog/stylish_dialog.dart';
import 'package:login_niche2/SELLER/sellerServices/services.dart';
import 'package:dio/dio.dart' as dio; // Use a unique prefix for Dio library
// import 'package:get/get_connect/http.dart' as getConnect;

class EditService extends StatefulWidget {
  const EditService({Key? key, required this.sid, required this.cid})
      : super(key: key);
  final String sid, cid;
  @override
  State<EditService> createState() => _EditServiceState();
}

class _EditServiceState extends State<EditService> {
  bool check = false;
  int num = 0;
  File? imageFile;
  List<Service>? lister;
  List<String> ids = ["1", "1", "2", "2", "2", "3", "3", "4", "4"];
  //String id = ids[widget.cid]
  // Create a new Dio instance

  final ImagePicker picker = ImagePicker();
  final API _api = API();
  var categories = <Category>[];
  var subcategories = <SubCategory>[];
  Category? selectedCategory;
  SubCategory? selectedSubCategory;
  final TextEditingController discountController = TextEditingController(),
      priceController = TextEditingController(),
      titleController = TextEditingController(),
      descriptionController = TextEditingController(),
      durationController = TextEditingController();
  @override
  void initState() {
    super.initState();
    getapidata();
    // _fetchCategories();
    //_fetchSubcategories(widget.)
  }

  bool isNumeric(String str) {
    // A simple function to check if a string represents a valid number
    if (str.isEmpty) {
      return false;
    }
    return double.tryParse(str) != null;
  }

  Future<void> getapidata() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String authToken = prefs.getString('token') ?? '';
    // print(authToken);
    String url = "${_api.baseURL}service/${widget.sid}";

    var result = await https.get(Uri.parse(url), headers: {'Token': authToken});
    print(result.body);
    lister = await jsonDecode(result.body)
        .map((item) => Service.fromJson(item))
        .toList()
        .cast<Service>();
    print('lister');
    print(lister?[0].serviceImage);

    setState(() {
      _fetchCategories();
    });
  }

  Future<void> updateService() async {
    print("hello");
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String authToken = prefs.getString('token') ?? '';

      dio.FormData formData = dio.FormData();

      Map<String, String> fields = {
        'subCategory_id': widget.cid,
        'service_description': descriptionController.text,
        'service_title': titleController.text,
        'service_price': priceController.text,
        'duration': durationController.text,
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

      dio.Response response = await dioInstance.put(
        'http://192.168.0.106:3000/service/${widget.sid}',
        data: formData,
      );

      if (response.statusCode == 200) {
        print('Profile updated successfully');
        successPopUp(context, 'Profile Updated',
            'Your profile has been successfully updated', 'success.json', () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const Services()));
        });
      } else {
        print('Error updating profile: ${response.data}');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  Future<void> _fetchCategories() async {
    List<Category>? fetchedCategories =
        await _api.getcategory(); // Add a null check here
    setState(() {
      categories = fetchedCategories;
      print("heloooooooooooo22222222222");

      print(lister![0].serviceImage);
      print(lister![0].serviceDescription);

      for (int i = 0; i < categories.length; i++) {
        if (categories[i].categoryId == 1) {
          selectedCategory = categories[i];
        }
      }
      print("heloooooooooooo");
      setState(() {
        _fetchSubcategories("2");
        // selectedSubCategory != null
        //     ? _fetchSubcategories(selectedCategory!.categoryId.toString())
        //     : null;
      });
    });
  }

  Future<void> _fetchSubcategories(String categoryId) async {
    List<SubCategory>? fetchedSubcategories =
        await _api.getsubcategory(categoryId);
    print(subcategories); // Add a null check here
    setState(() {
      subcategories = fetchedSubcategories;

      selectedSubCategory = subcategories[0];

      // print(selectedSubCategory!.subCategoryName);
      print("11111111111111111111111111111");
    });
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
    Widget categoryDropdown() {
      return DropdownButtonFormField<Category>(
        isExpanded: true,
        // hint: const Text(
        //   "Saloon",
        //   style: TextStyle(
        //     color: Colors.black54,
        //     fontSize: 15,
        //   ),
        // ),
        value: selectedCategory,
        icon: const Icon(
          Icons.keyboard_arrow_down,
          color: Colors.black54,
        ),
        style: const TextStyle(
          fontSize: 15,
          color: Colors.black,
        ),
        decoration: const InputDecoration(
          border: InputBorder.none,
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 15),
        ),
        items: categories.map((category) {
          return DropdownMenuItem<Category>(
            alignment: Alignment.topLeft,
            value: category,
            child: Text(
              category.categoryName!,
              style: const TextStyle(
                fontSize: 15,
                color: Colors.black,
              ),
            ),
          );
        }).toList(),
        onChanged: (Category? newValue) {
          setState(() {
            selectedCategory = newValue;
            // Fetch subcategories based on selected category
            if (newValue != null) {
              setState(() {
                //  _fetchSubcategories(newValue.categoryId!.toString());
                check = true;
              });
            }
          });
        },
      );
    }

    Widget subCategoryDropdown() {
      var subcategoriesForSelectedCategory = subcategories
          .where((subcategory) =>
              subcategory.parentId == selectedCategory?.categoryId)
          .toList();

      return DropdownButtonFormField<SubCategory>(
        isExpanded: true,
        hint: lister != null
            ? Text(
                lister![0].serviceTitle.toString(),
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 15,
                ),
              )
            : null,
        value: selectedSubCategory,
        icon: const Icon(
          Icons.keyboard_arrow_down,
          color: Colors.black54,
        ),
        style: const TextStyle(
          fontSize: 15,
          color: Colors.black,
        ),
        decoration: const InputDecoration(
          border: InputBorder.none,
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 15),
        ),
        items: subcategoriesForSelectedCategory.map((subcategory) {
          return DropdownMenuItem<SubCategory>(
            alignment: Alignment.topLeft,
            value: subcategory,
            child: Text(
              subcategory.subCategoryName!,
              style: const TextStyle(
                fontSize: 15,
                color: Colors.black,
              ),
            ),
          );
        }).toList(),
        onChanged: (SubCategory? newValue) {
          setState(() {
            selectedSubCategory = newValue;
          });
        },
      );
    }

    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

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

    Widget bottomSheet() {
      return Container(
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
                decoration: TextDecoration.none,
              ),
            ),
            SizedBox(height: h * 0.01),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    IconButton(
                      onPressed: () => getImage(ImageSource.camera),
                      icon: const Icon(Icons.camera_alt),
                      tooltip: "Camera",
                      iconSize: h * 0.04 + w * 0.04,
                    ),
                    Text("Camera")
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
                    Text("Gallery")
                  ],
                ),
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
          title: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.grey[100],
            ),
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
        body: lister != null &&
                selectedCategory != null &&
                selectedSubCategory != null
            ? SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.keyboard_backspace,
                                color: Colors.black),
                            onPressed: () => Navigator.pop(context),
                          ),
                          Text(
                            "Edit Service",
                            style: GoogleFonts.dmSans(
                              fontSize: fontSize,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF323B60),
                              decoration: TextDecoration.none,
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.done, color: Colors.black),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                      child: GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            backgroundColor: const Color(0xFFCEB290),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            context: context,
                            builder: ((builder) => bottomSheet()),
                          );
                        },
                        child: CircleAvatar(
                            radius: h * 0.05 + w * 0.05,
                            backgroundImage: imageFile != null
                                ? FileImage(File(imageFile!.path))
                                : NetworkImage(_api.baseURL +
                                        lister![0].serviceImage.toString())
                                    as ImageProvider,
                            child: Align(
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
                            )),
                      ),
                    ),
                    // StackedDropdown(
                    //   width: w * 0.9,
                    //   height: h * 0.07,
                    //   showSubCategory:
                    //       true, // Set to true if you want to show sub-category dropdown
                    //   title: 'Category',
                    //   dropdown: categoryDropdown(),
                    //   fontSize:
                    //       fonte, // Replace with your actual category dropdown widget
                    // ),
                    // StackedDropdown(
                    //   width: w * 0.9,
                    //   height: h * 0.07,
                    //   showSubCategory:
                    //       check, // Set to true when you want to show sub-category dropdown
                    //   title: 'Sub-Category',
                    //   dropdown:
                    //       subCategoryDropdown(), // Replace with your actual sub-category dropdown widget
                    //   fontSize:
                    //       fonte, // Replace with your actual category dropdown widget
                    // ),

                    StackedContainer(
                      text: 'Category',
                      labelText: selectedCategory!.categoryName.toString(),
                      suffixIcon: Icons.arrow_drop_down,
                      width: w * 0.9,
                      height: h * 0.07,
                      fontSize: fonte,
                      controller: titleController,
                    ),

                    StackedContainer(
                      text: 'SubCategory',
                      labelText:
                          selectedSubCategory!.subCategoryName.toString(),
                      suffixIcon: Icons.arrow_drop_down,
                      width: w * 0.9,
                      height: h * 0.07,
                      fontSize: fonte,
                      controller: titleController,
                    ),
                    StackedContainer(
                      text: 'Title',
                      labelText: lister![0].serviceTitle.toString(),
                      suffixIcon: Icons.title,
                      width: w * 0.9,
                      height: h * 0.07,
                      fontSize: fonte,
                      controller: titleController,
                    ),
                    StackedContainer(
                      text: 'Description',
                      labelText: lister![0].serviceDescription.toString(),
                      //hint: "h"
                      suffixIcon: Icons.description,
                      width: w * 0.9,
                      height: h * 0.2,
                      fontSize: fonte,
                      controller: descriptionController,
                      allowResizing: true,
                    ),
                    StackedContainer(
                      text: 'Price',
                      labelText: lister![0].servicePrice.toString(),
                      suffixIcon: Icons.monetization_on_outlined,
                      width: w * 0.9,
                      height: h * 0.07,
                      fontSize: fonte,
                      controller: priceController,
                    ),
                    StackedContainer(
                      text: 'Discount',
                      labelText: 'Discount',
                      suffixIcon: Icons.percent_outlined,
                      width: w * 0.9,
                      height: h * 0.07,
                      fontSize: fonte,
                      controller: discountController,
                    ),
                    StackedContainer(
                      text: 'Duration',
                      labelText: lister![0].duration.toString(),
                      suffixIcon: Icons.date_range,
                      width: w * 0.9,
                      height: h * 0.07,
                      fontSize: fonte,
                      controller: durationController,
                      textInputType: TextInputType
                          .number, // Add this line to set the keyboard type
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: Container(
                        width: Get.width,
                        height: Get.height * 0.06,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Color.fromARGB(255, 28, 77, 141),
                        ),
                        child: TextButton(
                          onPressed: () async {
                            // Validate data types
                            // if (!isNumeric(priceController.text)) {
                            //   showSnackBar(
                            //       context, 'Price must be a valid number.');
                            //   return;
                            // }

                            // if (!isNumeric(durationController.text)) {
                            //   showSnackBar(
                            //       context, 'Duration must be a valid number.');
                            //   return;
                            // }
                            await updateService();
                          },
                          child: Text(
                            "Confirm",
                            style: GoogleFonts.dmSans(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : Container());
  }
}
