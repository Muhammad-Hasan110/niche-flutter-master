import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;

  CustomCard(
      {required this.title, required this.description, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
     decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(10.0),
    image: imageUrl.isNotEmpty
        ? DecorationImage(
            image: NetworkImage(imageUrl),
            fit: BoxFit.cover,
          )
        : null,
  ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.6), // Semi-transparent background
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                description,
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  color: Color.fromARGB(196, 42, 41, 41),
                  fontSize: 14.0,
                  height: 1.3,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
