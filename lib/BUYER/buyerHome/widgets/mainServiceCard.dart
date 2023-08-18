// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_niche2/API/API.dart';
import 'package:login_niche2/BUYER/buyerHome/widgets/drawer.dart';

class MainServiceCard extends StatefulWidget {
  const MainServiceCard({super.key, required this.name, required this.img});
  final String name;
  final String img;
  @override
  State<MainServiceCard> createState() => _MainServiceCardState();
}

class _MainServiceCardState extends State<MainServiceCard> {
  final api = API();
  String word = "aaa\\aa/";

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CustomEndDrawer()),
          );
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Container(
                width: 90,
                height: 90,
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Image.network(
                  api.baseURL + widget.img.replaceAll(word[3], word[6]),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              widget.name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: 'DM Sans',
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
