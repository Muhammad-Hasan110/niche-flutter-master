// ignore_for_file: avoid_print, library_private_types_in_public_api
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:login_niche2/BUYER/notifications/notifications.dart';
import 'package:login_niche2/DataModler/category.dart';
import 'package:login_niche2/DataModler/banner.dart';
import 'package:login_niche2/API/API.dart';

import 'package:login_niche2/BUYER/buyerHome/widgets/banner.dart';
import 'package:login_niche2/BUYER/buyerHome/widgets/drawer.dart';
import 'package:login_niche2/BUYER/buyerHome/widgets/mainServiceCard.dart';
import 'package:login_niche2/utils/flutterflow/flutter_flow_icon_button.dart';
import 'package:login_niche2/utils/flutterflow/flutter_flow_model.dart';
import 'package:login_niche2/utils/flutterflow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'model/buyerhome_model.dart';
export 'model/buyerhome_model.dart';

class BuyerhomeWidget extends StatefulWidget {
  const BuyerhomeWidget({Key? key}) : super(key: key);

  @override
  _Buyer2homeWidgetState createState() => _Buyer2homeWidgetState();
}

class _Buyer2homeWidgetState extends State<BuyerhomeWidget> {
  late BuyerhomeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  List<Category>? categories;

  final API api = API();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BuyerhomeModel());
    getcategory();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  Future<void> getcategory() async {
    try {
      String url = "${api.baseURL}category";
      var result = await http.get(Uri.parse(url));
      print(result.body);
      categories = jsonDecode(result.body)
          .map((item) => Category.fromJson(item))
          .toList()
          .cast<Category>();
      setState(() {});
    } catch (error) {
      print("Error getting categories: $error");
      rethrow; // Rethrow the error for upper layers to handle
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        endDrawer: const CustomEndDrawer(),
        appBar: AppBar(
          toolbarHeight: 60, // Set a smaller toolbar height
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          title: Align(
            alignment: const AlignmentDirectional(-1, 0),
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 8), // Adjust the left padding
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  'assets/niche.png',
                  height: 40, // Reduce the height of the image
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          actions: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      right: 8), // Adjust the right padding
                  child: FlutterFlowIconButton(
                    borderRadius: 30,
                    buttonSize: 40,
                    icon: Icon(
                      Icons.notifications_none_rounded,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 24,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NotificationsWidget()));
                    },
                  ),
                ),
                FlutterFlowIconButton(
                  borderRadius: 30,
                  buttonSize: 40,
                  icon: Icon(
                    Icons.list,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 24,
                  ),
                  onPressed: () async {
                    scaffoldKey.currentState!.openEndDrawer();
                  },
                ),
              ],
            ),
          ],
          centerTitle: false,
          elevation: 0,
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height, // Set a finite height
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  BannerWidget(model: _model),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                    child: Container(
                      width: double.infinity,
                      height: MediaQuery.sizeOf(context).height * 0.159,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Align(
                        alignment: const AlignmentDirectional(0, 0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0, 20, 0, 10),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            55, 0, 30, 0),
                                    child: FlutterFlowIconButton(
                                      borderColor: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      borderRadius: 20,
                                      borderWidth: 1,
                                      buttonSize: 50,
                                      fillColor: const Color(0xFFF5EFE7),
                                      icon: Icon(
                                        Icons.favorite_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 24,
                                      ),
                                      onPressed: () {
                                        print('IconButton pressed ...');
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            38, 0, 0, 0),
                                    child: Text(
                                      'Favourites',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            30, 0, 30, 0),
                                    child: FlutterFlowIconButton(
                                      borderColor: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      borderRadius: 20,
                                      borderWidth: 1,
                                      buttonSize: 50,
                                      fillColor: const Color(0xFFF5EFE7),
                                      icon: Icon(
                                        Icons.card_giftcard_outlined,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 24,
                                      ),
                                      onPressed: () {
                                        print('IconButton pressed ...');
                                      },
                                    ),
                                  ),
                                  Text(
                                    'Gifts',
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Align(
                                    alignment: const AlignmentDirectional(0, 0),
                                    child: Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              30, 0, 55, 0),
                                      child: FlutterFlowIconButton(
                                        borderColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                        borderRadius: 20,
                                        borderWidth: 1,
                                        buttonSize: 50,
                                        fillColor: const Color(0xFFF5EFE7),
                                        icon: Icon(
                                          Icons.sell,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 24,
                                        ),
                                        onPressed: () {
                                          print('IconButton pressed ...');
                                        },
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 20, 0),
                                    child: Text(
                                      'Best Selling',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 30),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Our Services',
                          textAlign: TextAlign.start,
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'DM Sans',
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyMediumFamily),
                              ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(1, 0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CustomEndDrawer()),
                              );
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  'See all',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'DM Sans',
                                        fontWeight: FontWeight.bold,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily),
                                      ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 24,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Inside the build method of BuyerhomeWidget
                  Flexible(
                    flex: 1,
                    child: categories != null
                        ? Container(
                            width: 353,
                            height: MediaQuery.sizeOf(context).height * 4,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(7, 7, 7, 7),
                              child: Column(
                                children: [
                                  // Create rows of MainServiceCards
                                  for (int i = 0;
                                      i < categories!.length;
                                      i += 2)
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 10),
                                      child: Row(
                                        children: [
                                          for (int j = i;
                                              j < i + 2 &&
                                                  j < categories!.length;
                                              j++)
                                            Expanded(
                                              child: MainServiceCard(
                                                name: api.capitalize(
                                                    categories![j]
                                                        .categoryName
                                                        .toString()),
                                                img: categories![j]
                                                    .categoryImage
                                                    .toString(),
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          )
                        : Container(),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
