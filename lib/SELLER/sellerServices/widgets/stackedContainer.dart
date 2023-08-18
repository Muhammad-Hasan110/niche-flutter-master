import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StackedContainer extends StatelessWidget {
  final String text;
  final String labelText;
  final IconData suffixIcon;
  final double width;
  final double height;
  final double fontSize;
  final TextEditingController controller;
  final bool allowResizing;
  final TextInputType textInputType;
  StackedContainer({
    required this.text,
    required this.labelText,
    required this.suffixIcon,
    required this.width,
    required this.height,
    required this.fontSize,
    required this.controller,
    this.allowResizing = false,
    this.textInputType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          width: allowResizing ? width : double.infinity,
          height: height,
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
              keyboardType: textInputType,
              controller: controller,
              textAlign: TextAlign.start,
              maxLines: allowResizing ? null : 1, // Allow resizing if true
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: labelText,
                hintStyle: GoogleFonts.workSans(
                  fontSize: fontSize,
                  fontWeight: FontWeight.w200,
                  color: const Color(0xFF4F709C),
                  decoration: TextDecoration.none,
                ),
                suffixIcon: allowResizing
                    ? SizedBox(
                        width: 40, // Adjust as needed
                        height: height,
                        child: Center(
                          child: Icon(
                            suffixIcon,
                            size: 25,
                            color: Color(0xFF4F709C),
                          ),
                        ),
                      )
                    : Icon(
                        suffixIcon,
                        size: 25,
                        color: Color(0xFF4F709C),
                      ),
              ),
            ),
          ),
        ),
        Positioned(
          left: 35,
          top: 12,
          child: Container(
            padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
            color: Colors.white,
            child: Text(
              text,
              style: GoogleFonts.workSans(
                fontSize: fontSize,
                fontWeight: FontWeight.w500,
                color: const Color(0xFF4F709C),
                decoration: TextDecoration.none,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
