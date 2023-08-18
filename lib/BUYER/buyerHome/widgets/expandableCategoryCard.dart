// ignore_for_file: file_names, library_private_types_in_public_api

import 'package:flutter/material.dart';

import 'package:expandable/expandable.dart';
import 'package:login_niche2/API/model.dart';
import 'package:login_niche2/BUYER/buyerCatrgories/screen/SubCategorySevicesScreen.dart';

class ExpandableWidget extends StatefulWidget {
  final String mainCategory;
  final List<SubCategory> subcategories;

  const ExpandableWidget({
    Key? key,
    required this.mainCategory,
    required this.subcategories,
  }) : super(key: key);

  @override
  _ExpandableWidgetState createState() => _ExpandableWidgetState();
}

class _ExpandableWidgetState extends State<ExpandableWidget> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      child: Card(
        elevation: 8,
        shadowColor: Colors.black.withOpacity(0.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          constraints: const BoxConstraints(
            minHeight: 50,
          ),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: ExpandableNotifier(
            initialExpanded: false,
            child: ExpandablePanel(
              header: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                child: Text(
                  widget.mainCategory,
                  style: const TextStyle(
                    fontFamily: 'DM Sans',
                    color: Color(0xFF323B60),
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              collapsed: Container(),
              expanded: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: widget.subcategories
                    .map(
                      (subcategory) => Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(15, 10, 0, 10),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      SubCategorySevicesScreen(
                                          pid: subcategory.parentId.toString(),
                                          sid: subcategory.subCategoryId
                                              .toString())),
                            );
                          },
                          child: Text(
                            subcategory.subCategoryName
                                .toString(), // Use the 'title' attribute here
                            style: const TextStyle(
                              fontFamily: 'DM Sans',
                              color: Color.fromARGB(255, 63, 72, 111),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
              theme: const ExpandableThemeData(
                tapHeaderToExpand: true,
                tapBodyToExpand: true,
                // tapBodyToCollapse: true,
                headerAlignment: ExpandablePanelHeaderAlignment.center,
                hasIcon: true,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
