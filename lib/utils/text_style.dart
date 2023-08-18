// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Style extends StatefulWidget {
  var txt;
  Style({Key? key, this.txt}) : super(key: key);

  @override
  State<Style> createState() => _StyleState();
}

class _StyleState extends State<Style> {
  @override
  Widget build(BuildContext context) {
    var fontSize = 33.0;
    if (Get.width <= 380) {
      fontSize = 30.0;
    } else if (Get.width > 420 && Get.width <= 960) {
      fontSize = 35.0;
    } else if (Get.width > 380 && Get.width <= 420) {
      fontSize = 33.0;
    } else {
      fontSize = 35.0;
    }
    return Text(
      "${widget.txt}",
      style: GoogleFonts.dmSans(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          decoration: TextDecoration.none),
    );
  }
}
