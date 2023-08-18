
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StackedDropdown extends StatelessWidget {
  final double width;
  final double height;
  final bool showSubCategory;
  final String title;
  final Widget dropdown;
  final double fontSize;

  const StackedDropdown({
    Key? key,
    required this.width,
    required this.height,
    required this.showSubCategory,
    required this.title,
    required this.dropdown,
    required this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          width: width,
          height: height,
          margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
          padding: EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
            border: Border.all(
              color: showSubCategory ? Color(0xFF4F709C) : Colors.black38,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(10),
            shape: BoxShape.rectangle,
          ),
          child: Padding(
            padding: EdgeInsets.only(right: 3, top: 5, left: 15),
            child: dropdown,
          ),
        ),
        Positioned(
          left: 35,
          top: 12,
          child: Container(
            padding: EdgeInsets.only(bottom: 10, left: 10, right: 10),
            color: Colors.white,
            child: Text(
              title,
              style: GoogleFonts.workSans(
                fontSize: fontSize,
                fontWeight: FontWeight.w500,
                color: showSubCategory ? Color(0xFF4F709C) : Colors.black38,
                decoration: TextDecoration.none,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
