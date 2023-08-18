// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_niche2/SELLER/SellerHome/widgets/reviewCard.dart';

import '../sellerNavbar/seller_navbar.dart';

class Reviews extends StatefulWidget {
  const Reviews({super.key});

  @override
  State<Reviews> createState() => _ReviewsState();
}

class _ReviewsState extends State<Reviews> {
  @override
  Widget build(BuildContext context) {
    var Review_Name = ["Peter", "John", "Daniel"];
    var Review_Rating = [4.5, 4.1, 4.0];
    var Review_Date = ["02 Dec", "16 Aug", "03 Mar"];
    var Review_review = [
      'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet.'
    ];
    var Review_Image = [
      "assets/peter.jpeg",
      "assets/ali.avif",
      "assets/daniel.webp"
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NavbarSeller()),
            );
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: Text(
          "Reviews",
          style: TextStyle(color: Colors.black),
        ),
       
      ),
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index)


          {
           if(index>2)
             {
               index= index%3 ;


             }

            return ReviewCard(
                name: Review_Name[index],
                date: Review_Date[index],
                rating: Review_Rating[index],
                review: Review_review[0],
                image: Review_Image[index]);

          }
          ),
    );
  }
}
