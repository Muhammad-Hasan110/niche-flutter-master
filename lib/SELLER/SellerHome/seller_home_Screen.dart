// ignore_for_file: avoid_print, file_names, library_private_types_in_public_api

import 'package:login_niche2/API/API.dart';
import 'package:login_niche2/DataModler/servicecard.dart';
import 'package:login_niche2/SELLER/SellerHome/widgets/dashboardCard.dart';
import 'package:login_niche2/SELLER/SellerHome/widgets/reviewCard.dart';
import 'package:login_niche2/SELLER/SellerHome/widgets/serviceCard.dart';
import 'package:login_niche2/SELLER/sellerServices/services.dart';
import 'package:login_niche2/utils/flutterflow/flutter_flow_util.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../sellerReview/reviews.dart';
import '../sellerServices/add_service.dart';
import 'seller_home_model.dart';
export 'seller_home_model.dart';

class SellerHome extends StatefulWidget {
  const SellerHome({Key? key}) : super(key: key);

  @override
  _SellerHomeState createState() => _SellerHomeState();
}

class _SellerHomeState extends State<SellerHome> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  List<Service>? lister;

  final _api = API();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());
    getapidata();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (Get.width <= 360) {
    } else if (Get.width > 420 && Get.width <= 960) {
    } else if (Get.width > 380 && Get.width <= 420) {
    } else {}
    if (Get.width <= 360) {
    } else if (Get.width > 420 && Get.width <= 960) {
    } else if (Get.width > 380 && Get.width <= 420) {
    } else {}
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          elevation: 2,
          title: ClipRRect(
            borderRadius: BorderRadius.circular(8),
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
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SafeArea(
            top: true,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                const Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                      child: Text(
                        'Hello Joenda\nEzewele',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontFamily: 'Work Sans',
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF213555),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        DashboardCard(
                          text1: 'Level 2',
                          icon: Icons.badge_rounded,
                        ),
                        DashboardCard(
                          text1: 'Ratings 4.5',
                          icon: Icons.star_rounded,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        DashboardCard(
                          text1: '\$1200',
                          text2: 'Total Earnings',
                          icon: Icons.attach_money_rounded,
                        ),
                        DashboardCard(
                          text1: '49',
                          text2: 'Total Orders',
                          icon: Icons.receipt_rounded,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        DashboardCard(
                          text1: '15',
                          text2: 'Available Credits',
                          icon: Icons.monetization_on_rounded,
                        ),
                        DashboardCard(
                          text1: 'Free',
                          text2: 'Your Package',
                          icon: Icons.card_giftcard_rounded,
                        ),
                      ],
                    ),
                  ],
                ),
                // SizedBox(
                //   height: MediaQuery.of(context).size.height * 0.01,
                // ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'My Services',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF213555),
                              ),
                            ),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const AddService()),
                                    );
                                  },
                                  child: const Text(
                                    'Add a Service',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF4F709C),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: Get.width * 0.04,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const Services()),
                                    );
                                  },
                                  child: const Text(
                                    'View All',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF4F709C),
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      lister != null
                          ? ServiceCard(
                              serviceName: _api.capitalize(
                                  lister![0].serviceTitle.toString()),
                              serviceRatings: 4.5,
                              serviceTime: lister![0].duration!.toInt(),
                              servicePrice: double.parse(
                                  lister![0].servicePrice.toString()),
                              serviceImage: _api.baseURL +
                                  lister![0].serviceImage.toString(),
                              ONTap: () {},
                            )
                          : Container(color: Colors.red),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      // ServiceCard(
                      //   serviceName: 'Sofa Cleaning',
                      //   serviceRatings: 4.1,
                      //   serviceTime: '30 mins',
                      //   servicePrice: 79.99,
                      //   serviceImage:
                      //       "https://img.freepik.com/premium-photo/dry-cleaner-s-employee-removing-dirt-from-furniture-flat-closeup_152904-2670.jpg?w=740",
                      //   onDelete: () {
                      //     print("assg");
                      //   },
                      //   onEdit: () {
                      //     print('edit');
                      //   },
                      // ),
                      // SizedBox(
                      //   height: MediaQuery.of(context).size.height * 0.02,
                      // ),
                      // ServiceCard(
                      //     serviceName: 'Car Repairing',
                      //     serviceRatings: 4.0,
                      //     serviceTime: '2 hour',
                      //     servicePrice: 149.99,
                      //     serviceImage:
                      //         "https://img.freepik.com/premium-photo/auto-car-repair-service-center-mechanic-examining-car-suspension_136930-6.jpg?w=740"),

                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),

                      // Generated code for this Row Widget...
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Reviews',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF213555),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Reviews()),
                                );
                                // Add your view all functionality here
                              },
                              child: const Text(
                                'View All',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF4F709C),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const ReviewCard(
                        name: 'Peter Parker',
                        date: '02 Dec',
                        rating: 4.5,
                        review:
                            'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet.',
                        image: 'assets/peter.jpeg',
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> getapidata() async {
    String url = "${_api.baseURL}service";
    var result = await http.get(Uri.parse(url));
    print(result.body);
    lister = jsonDecode(result.body)
        .map((item) => Service.fromJson(item))
        .toList()
        .cast<Service>();
    setState(() {});
  }
}
