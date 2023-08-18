import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final double fonte;

  const MenuTile({
    required this.title,
    required this.icon,
    required this.fonte,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Material(
        elevation:
            4, // Adjust elevation as needed for the desired shadow effect
        borderRadius: BorderRadius.circular(10),
        child: Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 4,
                offset: Offset(0, 2), // Shadow position (x, y)
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Icon(
                  icon,
                  color: Color(0xFF4F709C),
                ),
                SizedBox(width: 10),
                Text(
                  title,
                  style: GoogleFonts.workSans(
                    fontSize: fonte,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF4F709C),
                    decoration: TextDecoration.none,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
