import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:login_niche2/SELLER/SellerHome/widgets/serviceCard.dart';

class Service {
  int? serviceId;
  int? sellerId;
  int? subcategoryId;
  String? serviceTitle;
  String? serviceDescription;
  String? servicePrice;
  int? duration;
  String? serviceImage;

  Service(
      {this.serviceId,
      this.sellerId,
      this.subcategoryId,
      this.serviceTitle,
      this.serviceDescription,
      this.servicePrice,
      this.duration,
      this.serviceImage});

  Service.fromJson(Map<String, dynamic> json) {
    serviceId = json['service_id'];
    sellerId = json['seller_id'];
    subcategoryId = json['subcategory_id'];
    serviceTitle = json['service_title'];
    serviceDescription = json['service_description'];
    servicePrice = json['service_price'];
    duration = json['duration'];
    serviceImage = json['service_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['service_id'] = this.serviceId;
    data['seller_id'] = this.sellerId;
    data['subcategory_id'] = this.subcategoryId;
    data['service_title'] = this.serviceTitle;
    data['service_description'] = this.serviceDescription;
    data['service_price'] = this.servicePrice;
    data['duration'] = this.duration;
    data['service_image'] = this.serviceImage;
    return data;
  }
}

class Service_Card extends StatefulWidget {
  const Service_Card({super.key});

  @override
  State<Service_Card> createState() => _Service_CardState();
}

class _Service_CardState extends State<Service_Card> {
  List<Service>? lister;

  @override
  void initState() {
    super.initState();
    getapidata();
    // print("helooooooooooooo465654545");
    // print(lister![0].serviceImage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: lister != null ? getlist() : Container());
  }

  Widget getlist() {
    return ListView.builder(
        itemCount: lister!.length,
        itemBuilder: (BuildContext context, int index) {
          return ServiceCard(
            serviceName: lister![index].serviceTitle.toString(),
            serviceRatings: 4.9,
            serviceTime: lister![index].duration!.toInt(),
            servicePrice: double.parse(lister![index].duration!.toString()),
            serviceImage: "assets/peter.jpeg",
            ONTap: () {},
          );
        });
  }

  Future<void> getapidata() async {
    String url = "http:// 192.168.0.104:3000/service";
    var result = await http.get(Uri.parse(url));
    print(result.body);
    lister = jsonDecode(result.body)
        .map((item) => Service.fromJson(item))
        .toList()
        .cast<Service>();
    setState(() {});
  }
}
