import 'package:flutter/material.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';

void showSnackBar(BuildContext context, String message) {
  final snackBar = SnackBar(
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    elevation: 0,
    margin: EdgeInsets.only(
      bottom: MediaQuery.of(context).size.height - 100,
      left: 5,
      right: 5,
    ), // Move snackbar to the top
    content: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3), // Shadow color
            spreadRadius: 2,
            blurRadius: 4,
            offset: Offset(0, 2), // Shadow offset
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Text(
            message,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    ),
    duration: const Duration(seconds: 2),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

typedef VoidCallback = void Function();

void successPopUp(BuildContext context, String title, String desc,
    String animation, VoidCallback onpressed) async {
  return Dialogs.materialDialog(
    color: Colors.white,
    msg: desc,
    title: title,
    lottieBuilder: Lottie.asset(
      'assets/lottie_animations/$animation',
      fit: BoxFit.contain,
    ),
    dialogWidth: kIsWeb ? 0.3 : null,
    context: context,
    actions: [
      IconsButton(
        onPressed: onpressed,
        text: 'Continue',
        iconData: Icons.done,
        color: Colors.blue,
        textStyle: TextStyle(color: Colors.white),
        iconColor: Colors.white,
      ),
    ],
  );
}
