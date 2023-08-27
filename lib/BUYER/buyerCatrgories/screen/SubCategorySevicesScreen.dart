import 'package:login_niche2/API/API.dart';
import 'package:login_niche2/API/model.dart';
import 'package:http/http.dart' as http;
import 'package:login_niche2/BUYER/buyerCatrgories/model/SubCategorySevicesModel.dart';
import 'package:login_niche2/BUYER/buyerCatrgories/screen/ServiceDetailsScreen.dart';
import 'package:login_niche2/BUYER/buyerCatrgories/widgets/ServiceCard.dart';
import 'package:login_niche2/BUYER/buyerHome/buyerhome.dart';
import 'package:login_niche2/BUYER/buyerHome/widgets/drawer.dart';
import 'package:login_niche2/BUYER/buyerNavbar/navbar_buyer.dart';
import 'package:login_niche2/DataModler/servicecard.dart';
import 'package:login_niche2/utils/flutterflow/flutter_flow_drop_down.dart';
import 'package:login_niche2/utils/flutterflow/flutter_flow_theme.dart';
import 'package:login_niche2/utils/flutterflow/flutter_flow_util.dart';
import 'package:login_niche2/utils/flutterflow/flutter_flow_widgets.dart';
import 'package:login_niche2/utils/flutterflow/form_field_controller.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
export '../model/SubCategorySevicesModel.dart';

class SubCategorySevicesScreen extends StatefulWidget {
  SubCategorySevicesScreen({Key? key, required this.pid, required this.sid})
      : super(key: key);
  final String pid;
  final String sid;
  @override
  _SubCategorySevicesScreenState createState() =>
      _SubCategorySevicesScreenState();
}

class _SubCategorySevicesScreenState extends State<SubCategorySevicesScreen> {
  late SubCategorySevicesModel _model;
  List<Service>? services;
  List<Service>? services2;
  final api = API();
  final String word = "aaa\\a/";
  String img = " ";
  List<SubCategory>? subcategories;
  SubCategory? selectedSubcategory;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SubCategorySevicesModel());

    _model.textController ??= TextEditingController();
    getSubcategories();
    getservice();
  }

  Future<void> getSubcategories() async {
    try {
      String url =
          "${api.baseURL}category/${widget.pid}"; // Update the URL pattern
      var result = await http.get(Uri.parse(url));
      List<dynamic> subcategoryJsonList = jsonDecode(result.body);
      subcategories = subcategoryJsonList
          .map((item) => SubCategory.fromJson(item))
          .toList()
          .cast<SubCategory>();
      print(subcategories);

      selectedSubcategory = subcategories!.firstWhere(
          (subcategory) => subcategory.subCategoryId.toString() == widget.sid,
          // ignore: null_closures
          orElse: null);
    } catch (error) {
      print("Error getting subcategories: $error");
      rethrow; // Rethrow the error for upper layers to handle
    }
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      endDrawer: const CustomEndDrawer(),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        top: true,
        child: Container(
            width: 853,
            height: MediaQuery.sizeOf(context).height * 1,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: subcategories != null
                ? SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Flexible(
                          flex: 1,
                          child: Container(
                            height: MediaQuery.sizeOf(context).height * 0.4,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(api.baseURL +
                                      selectedSubcategory!.subCategoryImage
                                          .toString())),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  // mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              10, 0, 0, 0),
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      NavbarBuyer()));
                                        },
                                        child: Icon(
                                          Icons.arrow_back_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          size: 24,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(12, 8, 12, 14),
                                        child: Container(
                                          width: double.infinity,
                                          height: 46,
                                          decoration: BoxDecoration(
                                            color: const Color(0x1BF1F4F8),
                                            boxShadow: [
                                              const BoxShadow(
                                                blurRadius: 4,
                                                color: Color(0x33000000),
                                                offset: Offset(0, 2),
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(8, 0, 8, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(4, 0, 4, 0),
                                                  child: Icon(
                                                    Icons.search_rounded,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    size: 24,
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(
                                                            4, 0, 0, 0),
                                                    child: TextFormField(
                                                      controller:
                                                          _model.textController,
                                                      onChanged: (_) =>
                                                          EasyDebounce.debounce(
                                                        '_model.textController',
                                                        const Duration(
                                                            milliseconds: 2000),
                                                        () => setState(() {}),
                                                      ),
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        hintText:
                                                            'Shop or Service name',
                                                        hintStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'DM Sans',
                                                                  color: const Color(
                                                                      0xFF8F90A6),
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily),
                                                                ),
                                                        enabledBorder:
                                                            const UnderlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0x00000000),
                                                            width: 1,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    4.0),
                                                            topRight:
                                                                Radius.circular(
                                                                    4.0),
                                                          ),
                                                        ),
                                                        focusedBorder:
                                                            const UnderlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0x00000000),
                                                            width: 1,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    4.0),
                                                            topRight:
                                                                Radius.circular(
                                                                    4.0),
                                                          ),
                                                        ),
                                                        errorBorder:
                                                            const UnderlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0x00000000),
                                                            width: 1,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    4.0),
                                                            topRight:
                                                                Radius.circular(
                                                                    4.0),
                                                          ),
                                                        ),
                                                        focusedErrorBorder:
                                                            const UnderlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0x00000000),
                                                            width: 1,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    4.0),
                                                            topRight:
                                                                Radius.circular(
                                                                    4.0),
                                                          ),
                                                        ),
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'DM Sans',
                                                                color: const Color(
                                                                    0xFF95A1AC),
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily),
                                                              ),
                                                      validator: _model
                                                          .textControllerValidator
                                                          .asValidator(context),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Builder(
                                          builder: (BuildContext context) {
                                            return GestureDetector(
                                              onTap: () {
                                                print("sss");
                                                Scaffold.of(context)
                                                    .openEndDrawer();
                                              },
                                              child: const Icon(
                                                Icons.list,
                                                color: Colors.white,
                                              ),
                                            );
                                          },
                                        ))
                                  ],
                                ),
                                Flexible(
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Flexible(
                                        child: Container(
                                          width: 213,
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              2.2,
                                          decoration: const BoxDecoration(
                                            color: Color(0x00FFFFFF),
                                          ),
                                          child: Align(
                                            alignment:
                                                const AlignmentDirectional(
                                                    -1, 1),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(10, 0, 0, 10),
                                              child: AutoSizeText(
                                                api.capitalize(
                                                    selectedSubcategory!
                                                        .subCategoryName
                                                        .toString()),
                                                textAlign: TextAlign.start,
                                                maxLines: 2,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          fontSize: 30,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily),
                                                          lineHeight: 1,
                                                        ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: 130, // Adjust the width as needed
                                  child: FlutterFlowDropDown(
                                    controller:
                                        _model.dropDownValueController ??=
                                            FormFieldController<String>(null),
                                    options: [
                                      'Default',
                                      'High to Low',
                                      'Low to High'
                                    ],
                                    onChanged: (val) => setState(
                                        () => _model.dropDownValue = val),
                                    height: 40,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          fontSize: 13,
                                          useGoogleFonts:
                                              GoogleFonts.asMap().containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily,
                                          ),
                                        ),
                                    hintText: 'Price',
                                    icon: Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 24,
                                    ),
                                    fillColor: const Color(0xFFF5EFE7),
                                    elevation: 2,
                                    borderColor:
                                        FlutterFlowTheme.of(context).alternate,
                                    borderWidth: 2,
                                    borderRadius: 30,
                                    margin: const EdgeInsets.only(left: 10),
                                    hidesUnderline: true,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: FFButtonWidget(
                                    onPressed: () {
                                      print('Button pressed ...');
                                    },
                                    text: 'Offers',
                                    icon: const Icon(
                                      Icons.local_offer_outlined,
                                      size: 15,
                                    ),
                                    options: FFButtonOptions(
                                      color: const Color(0xFFF5EFE7),
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                      elevation: 0,
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: FFButtonWidget(
                                    onPressed: () {
                                      print('Button pressed ...');
                                    },
                                    text: 'Featured',
                                    icon: const Icon(
                                      Icons.featured_play_list_outlined,
                                      size: 15,
                                    ),
                                    options: FFButtonOptions(
                                      color: const Color(0xFFF5EFE7),
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                      elevation: 0,
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: FFButtonWidget(
                                    onPressed: () {
                                      print('Button pressed ...');
                                    },
                                    text: 'Best Selling',
                                    icon: const Icon(
                                      Icons.arrow_upward_outlined,
                                      size: 15,
                                    ),
                                    options: FFButtonOptions(
                                      color: const Color(0xFFF5EFE7),
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                      elevation: 0,
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 5, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      7, 0, 0, 0),
                                  child: Text(
                                    '102 shops giving ${api.capitalize(selectedSubcategory!.subCategoryName.toString())} service',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 2,
                          child: Container(
                            width: 509,
                            height: MediaQuery.sizeOf(context).height * 0.7,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            alignment: const AlignmentDirectional(0, 0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                services2 != null
                                    ? Column(
                                        children: List.generate(
                                            services2!.length, (index) {
                                          return ServiceCard(
                                            title: api.capitalize(
                                                services2![index]
                                                    .serviceTitle
                                                    .toString()),
                                            description: services2![index]
                                                .serviceDescription
                                                .toString(),
                                            img: api.baseURL +
                                                services2![index]
                                                    .serviceImage
                                                    .toString(),
                                            price: services2![index]
                                                .servicePrice
                                                .toString(),
                                            ratings: '4.9',
                                            time: services2![index]
                                                .duration
                                                .toString(),
                                            ONTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      ServiceDetailScreen(
                                                    pid: widget.pid,
                                                    sid: services2![index]
                                                        .serviceId
                                                        .toString(),
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        }),
                                      )

                                    // Expanded(
                                    //     child: ListView.builder(
                                    //         itemCount: services2!.length,
                                    //         itemBuilder: (BuildContext context,
                                    //             int index) {
                                    //           return Flexible(
                                    //             child: ServiceCard(
                                    //               title: api.capitalize(
                                    //                   services2![index]
                                    //                       .serviceTitle
                                    //                       .toString()),
                                    //               description: services2![index]
                                    //                   .serviceDescription
                                    //                   .toString(),
                                    //               img: api.baseURL +
                                    //                   services2![index]
                                    //                       .serviceImage
                                    //                       .toString(),
                                    //               price: services2![index]
                                    //                   .servicePrice
                                    //                   .toString(),
                                    //               ratings: '4.9',
                                    //               time: services2![index]
                                    //                   .duration
                                    //                   .toString(),
                                    //               ONTap: () {
                                    //                 Navigator.push(
                                    //                   context,
                                    //                   MaterialPageRoute(
                                    //                     builder: (context) =>
                                    //                         ServiceDetailScreen(
                                    //                             id: services2![
                                    //                                     index]
                                    //                                 .serviceId
                                    //                                 .toString()),
                                    //                   ),
                                    //                 );
                                    //               },
                                    //             ),
                                    //           );
                                    //         })
                                    //         )
                                    : Container()
                              ].addToEnd(const SizedBox(height: 40)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : Container()),
      ),
    );
  }

  Future<void> getservice() async {
    try {
      String url = "${api.baseURL}service/";
      var result = await http.get(Uri.parse(url));
      print(result.body);
      services2 = jsonDecode(result.body)
          .map((item) => Service.fromJson(item))
          .toList()
          .cast<Service>();
      print(widget.sid);
      print(services2);

      setState(() {});
    } catch (error) {
      print("Error getting categories: $error");
      rethrow; // Rethrow the error for upper layers to handle
    }
  }

  Future<void> getS() async {
    try {
      String url = "${api.baseURL}service";
      var result = await http.get(Uri.parse(url));
      List<dynamic> servicesJsonList = jsonDecode(result.body);
      services = servicesJsonList
          .map((item) => Service.fromJson(item))
          .toList()
          .cast<Service>();
      print(widget.sid);
      print(services![0]);
      services2 = services!
          .where(
            (service) => service.subCategoryId.toString() == widget.sid,
            // ignore: null_closures
          )
          .toList();
      print("\n\nPrinting Servicesssss\n\n");
      print(services2);
    } catch (error) {
      print("Error getting subcategories: $error");
      rethrow; // Rethrow the error for upper layers to handle
    }
  }
}
