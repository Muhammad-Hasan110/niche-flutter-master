// ignore_for_file: file_names, prefer_const_constructors_in_immutables, use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ServiceCard extends StatefulWidget {
  final String serviceName;
  final double serviceRatings;
  final int serviceTime;
  final double servicePrice;
  final String serviceImage;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;
  final VoidCallback? onPreview;

  ServiceCard({
    required this.serviceName,
    required this.serviceRatings,
    required this.serviceTime,
    required this.servicePrice,
    required this.serviceImage,
    this.onDelete,
    this.onEdit,
    this.onPreview,
    required Null Function() ONTap,
  });

  @override
  _ServiceCardState createState() => _ServiceCardState();
}

class _ServiceCardState extends State<ServiceCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;
  String word = "aaa\\aa/";

  @override
  void initState() {
    print(word[3]);
    print(word[6]);
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _slideAnimation =
        Tween<Offset>(begin: Offset(1, 0), end: Offset.zero).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeIn,
      ),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _slideAnimation,
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: GestureDetector(
          onHorizontalDragEnd: (details) {
            if (details.velocity.pixelsPerSecond.dx.abs() > 500) {
              _animationController.reverse().then((_) {
                // Perform any desired action after the animation is complete
              });
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFF213555).withOpacity(0.1),
                    blurRadius: 4.0,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 180,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                            image: NetworkImage((widget.serviceImage
                                .replaceAll(word[3], word[6]))),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        child: PopupMenuButton<int>(
                          color: Colors.white,
                          iconSize: 30,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          itemBuilder: (context) => [
                            PopupMenuItem<int>(
                              value: 0,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: Text(
                                  "Preview",
                                  style: GoogleFonts.dmSans(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF323B60),
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                              ),
                            ),
                            PopupMenuItem<int>(
                              value: 1,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Edit",
                                  style: GoogleFonts.dmSans(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF323B60),
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                              ),
                            ),
                            PopupMenuItem<int>(
                              value: 2,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Delete",
                                  style: GoogleFonts.dmSans(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF323B60),
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                              ),
                            ),
                          ],
                          onSelected: (item) {
                            // Handle the selected item here
                            switch (item) {
                              case 0:
                                if (widget.onPreview != null) {
                                  widget.onPreview!();
                                }
                                break;
                              case 1:
                                if (widget.onEdit != null) {
                                  widget.onEdit!();
                                }
                                break;
                              case 2:
                                if (widget.onDelete != null) {
                                  //daba ka code dldo
                                  widget.onDelete!();
                                }
                                break;
                            }
                          },
                        ),
                      ),
                      Positioned(
                        top: 10,
                        right: 10,
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 16,
                              ),
                              SizedBox(width: 4),
                              Text(
                                widget.serviceRatings.toString(),
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.serviceName,
                                maxLines:
                                    2, // Set maxLines to wrap text to two lines
                                overflow: TextOverflow
                                    .ellipsis, // Show ellipsis if text overflows
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                "Duration: " +
                                    widget.serviceTime.toString() +
                                    " hours",
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          '\$${widget.servicePrice.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        // Add the PopupMenuButton here
                      ],
                    ),
                  ),
                  // Padding(
                  //   padding: EdgeInsets.all(12),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           Text(
                  //             widget.serviceName,
                  //             style: TextStyle(
                  //               fontSize: 18,
                  //               fontWeight: FontWeight.bold,
                  //               color: Colors.black,
                  //             ),
                  //           ),
                  //           SizedBox(height: 8),
                  //           Text(
                  //             widget.serviceTime.toString(),
                  //             style: TextStyle(
                  //               fontSize: 14,
                  //               color: Colors.grey,
                  //             ),
                  //           ),
                  //         ],
                  //       ),
                  //       Text(
                  //         '\$${widget.servicePrice}',
                  //         style: TextStyle(
                  //           fontSize: 16,
                  //           fontWeight: FontWeight.bold,
                  //           color: Colors.black,
                  //         ),
                  //       ),
                  //       // Add the PopupMenuButton here
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
