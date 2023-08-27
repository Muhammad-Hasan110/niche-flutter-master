import 'package:flutter/material.dart';
import 'package:login_niche2/API/API.dart';
import 'package:login_niche2/Data%20Integration/getService.dart';
import 'package:login_niche2/DataModler/servicecard.dart';
import 'package:login_niche2/SELLER/SellerHome/widgets/serviceCard.dart';
import 'package:login_niche2/SELLER/sellerServices/add_service.dart';
import 'package:login_niche2/SELLER/sellerServices/edit_service.dart';
import 'package:login_niche2/SELLER/sellerServices/servicescreen.dart';
import '../sellerNavbar/seller_navbar.dart';

class Services extends StatefulWidget {
  const Services({super.key});

  @override
  State<Services> createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  bool _isShown = true;
  List<Service> services = [];
  final getservice = GetService();

  final _api = API();

  void _delete(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: const Text('Please Confirm'),
            content: const Text('Are you sure to remove the box?'),
            actions: [
              // The "Yes" button
              TextButton(
                  onPressed: () {
                    // Remove the box
                    setState(() {
                      _isShown = false;
                    });

                    // Close the dialog
                    Navigator.of(context).pop();
                  },
                  child: const Text('Yes')),
              TextButton(
                  onPressed: () {
                    // Close the dialog
                    Navigator.of(context).pop();
                  },
                  child: const Text('No'))
            ],
          );
        });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    void showSnackBar(BuildContext context, String message) {
      final snackBar = SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.black87,
        elevation: 0,
        content: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            message,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        duration: const Duration(seconds: 2),
      );

      ScaffoldMessenger.of(context).showSnackBar(
        snackBar,
      );
    }

    return DefaultTabController(
      length: 2,
      child: Scaffold(
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddService()),
              );
            },
            child: Icon(Icons.add),
            backgroundColor: Color(0xFF6440FE),
          ),
          backgroundColor: Colors.white,
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
              "Your Services",
              style: TextStyle(color: Colors.black),
            ),
            bottom: const TabBar(
                indicatorColor: Color(0xFF4F709C),
                indicatorPadding: EdgeInsets.only(bottom: 10, left: 10),
                indicatorWeight: 2,
                tabs: [
                  Tab(
                    child: Text("Active",
                        style: TextStyle(color: Color(0xFF6440FE))),
                  ),
                  Tab(
                    child: Text("Draft",
                        style: TextStyle(color: Color(0xFF6440FE))),
                  ),
                ]),
          ),
          body: TabBarView(
            children: [
              FutureBuilder(
                  future: getservice.getapidata(services),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          itemCount: services.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Stack(children: [
                              ServiceCard(
                                serviceName:
                                    services[index].serviceTitle.toString(),
                                serviceRatings: 4.9,
                                serviceTime: services[index].duration!.toInt(),
                                servicePrice: double.parse(
                                    services[index].duration!.toString()),
                                serviceImage: _api.baseURL +
                                    services[index].serviceImage.toString(),
                                onEdit: () {
                                  print('edit');
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => EditService(
                                        sid: services[index]
                                            .serviceId
                                            .toString(),
                                        cid: services[index]
                                            .subCategoryId
                                            .toString(),
                                      ),
                                    ),
                                  );
                                  // Perform edit action
                                },
                                onDelete: () {
                                  print('delete');
                                  // Perform delete action
                                },
                                onPreview: () {
                                  // Perform preview action
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SellerserviceWidget(
                                          sid:
                                              services[0].serviceId.toString()),
                                    ),
                                  );
                                },
                                ONTap: () {},
                              ),
                            ]);
                          });
                    }

                    return Center(child: CircularProgressIndicator());
                  }),
              FutureBuilder(
                  future: getservice.getapidata(services),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          itemCount: services.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Stack(children: [
                              ServiceCard(
                                serviceName:
                                    services[index].serviceTitle.toString(),
                                serviceRatings: 4.9,
                                serviceTime: services[index].duration!.toInt(),
                                servicePrice: double.parse(
                                    services[index].duration!.toString()),
                                serviceImage: _api.baseURL +
                                    services[index].serviceImage.toString(),
                                onEdit: () {
                                  print('edit');
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => EditService(
                                        sid: services[index]
                                            .serviceId
                                            .toString(),
                                        cid: services[index]
                                            .subCategoryId
                                            .toString(),
                                      ),
                                    ),
                                  );
                                  // Perform edit action
                                },
                                onDelete: () {
                                  print('delete');
                                  // Perform delete action
                                },
                                onPreview: () {
                                  // Perform preview action
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SellerserviceWidget(
                                          sid:
                                              services[0].serviceId.toString()),
                                    ),
                                  );
                                },
                                ONTap: () {},
                              ),
                            ]);
                          });
                    }

                    return Center(child: CircularProgressIndicator());
                  }),
            ],
          )),
    );
  }
}
