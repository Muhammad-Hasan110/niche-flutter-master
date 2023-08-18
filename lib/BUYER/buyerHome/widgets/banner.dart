import 'package:flutter/cupertino.dart';
import 'package:login_niche2/API/API.dart';
import 'package:login_niche2/BUYER/buyerHome/model/buyerhome_model.dart';
import 'package:login_niche2/DataModler/banner.dart';
import 'package:login_niche2/utils/flutterflow/flutter_flow_theme.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';

class BannerWidget extends StatefulWidget {
  const BannerWidget({
    super.key,
    required this.model,
  });

  // ignore: empty_constructor_bodies
  final BuyerhomeModel model;

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  List<Banners>? banners;
  String word = "aaa\\aa/";

  @override
  void initState() {
    super.initState();
    getbanner();
  }

  final API api = API();
  Future<void> getbanner() async {
    try {
      String url = "${api.baseURL}banner";
      var result = await http.get(Uri.parse(url));
      print(result.body);
      banners = jsonDecode(result.body)
          .map((item) => Banners.fromJson(item))
          .toList()
          .cast<Banners>();
      print(banners);
      setState(() {});
    } catch (error) {
      print("Error getting categories: $error");
      rethrow; // Rethrow the error for upper layers to handle
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
        ),
        child: SizedBox(
          height: 531,
          child: Stack(
            children: [
              Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 40),
                  child: banners != null
                      ? PageView(
                          controller: widget.model.pageViewController ??=
                              PageController(initialPage: 0),
                          scrollDirection: Axis.horizontal,
                          children: [
                            for (int i = 0; i < 3; i++)
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  api.baseURL +
                                      banners![i]
                                          .bannerImage
                                          .toString()
                                          .replaceAll(word[3], word[6]),
                                  height: 200,
                                  fit: BoxFit.cover,
                                ),
                              ),
                          ],
                        )
                      : Container()),
              Align(
                alignment: const AlignmentDirectional(0, 1),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                  child: smooth_page_indicator.SmoothPageIndicator(
                    controller: widget.model.pageViewController ??=
                        PageController(initialPage: 0),
                    count: 3,
                    axisDirection: Axis.horizontal,
                    onDotClicked: (i) async {
                      await widget.model.pageViewController!.animateToPage(
                        i,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.ease,
                      );
                    },
                    effect: const smooth_page_indicator.SlideEffect(
                      spacing: 8,
                      radius: 16,
                      dotWidth: 8,
                      dotHeight: 8,
                      dotColor: Color(0xFFA7A9BE),
                      activeDotColor: Color(0xFFD8C4B6),
                      paintStyle: PaintingStyle.fill,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
