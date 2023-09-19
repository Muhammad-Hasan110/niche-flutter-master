// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:login_niche2/BUYER/buyerHome/buyerhome.dart';
import 'package:login_niche2/BUYER/buyerProfile1/buyer_profile_screen.dart';
import 'package:login_niche2/BUYER/buyerSearch/searchwidget.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:login_niche2/BUYER/buyerjobpost/buyerjobpost.dart';

class NavbarBuyer extends StatefulWidget {
  const NavbarBuyer({Key? key}) : super(key: key);

  @override
  _NavbarBuyerState createState() => _NavbarBuyerState();
}

class _NavbarBuyerState extends State<NavbarBuyer> {
  final Color navigationBarColor = Colors.white;
  int _selectedIndex = 0;
  late PageController _pageController;

  List<Widget> tabItems = [
    const BuyerhomeWidget(),
    const SearchWidget(),
    BuyerjobpostsWidget(),
    Container(),
    const BuyerProfWidget(),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _selectedIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: tabItems,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      bottomNavigationBar: FlashyTabBar(
        animationCurve: Curves.linear,
        selectedIndex: _selectedIndex,
        iconSize: 30,
        showElevation: false,
        onItemSelected: (index) {
          setState(() {
            _selectedIndex = index;
            _pageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          });
        },
        items: [
          FlashyTabBarItem(
            icon: const Icon(Icons.home_filled, color: Color(0xFF4F709C)),
            title: const Text(
              'Home',
              style: TextStyle(color: Color(0xFF323B60)),
            ),
          ),
          FlashyTabBarItem(
            icon: const Icon(Icons.search, color: Color(0xFF4F709C)),
            title: const Text('Search',
                style: TextStyle(color: Color(0xFF323B60))),
          ),
          FlashyTabBarItem(
            icon: const Icon(Icons.post_add, color: Color(0xFF4F709C)),
            title:
                const Text('Posts', style: TextStyle(color: Color(0xFF323B60))),
          ),
          FlashyTabBarItem(
            icon: const Icon(
              Icons.shopping_cart,
              color: Color(0xFF4F709C),
            ),
            title: const Text(
              'Cart',
              style: TextStyle(
                color: Color(0xFF323B60),
              ),
            ),
          ),
          FlashyTabBarItem(
            icon: const Icon(
              Icons.person,
              color: Color(0xFF4F709C),
            ),
            title: const Text(
              "Profile",
              style: TextStyle(color: Color(0xFF323B60)),
            ),
          ),
        ],
      ),
    );
  }
}
