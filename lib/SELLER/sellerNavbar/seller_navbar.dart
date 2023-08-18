// ignore_for_file: library_private_types_in_public_api, unused_field

import 'package:flutter/material.dart';
import 'package:login_niche2/SELLER/SellerHome/seller_home_Screen.dart';
import 'package:login_niche2/SELLER/sellerProfile/seller_profile.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';

class NavbarSeller extends StatefulWidget {
  const NavbarSeller({Key? key}) : super(key: key);

  @override
  _NavbarSellerState createState() => _NavbarSellerState();
}

class _NavbarSellerState extends State<NavbarSeller> {
  int _selectedIndex = 0;
  late PageController _pageController;

  final List<Widget> _tabItems = [
    const SellerHome(),
    Container(),
    Container(),
    Container(),
    const Seller_Profile(),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _tabItems[_selectedIndex],
      ),
      bottomNavigationBar: FlashyTabBar(
        animationCurve: Curves.linear,
        selectedIndex: _selectedIndex,
        iconSize: 30,
        showElevation: false,
        onItemSelected: (index) => setState(() {
          _selectedIndex = index;
        }),
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
            title: const Text('Search', style: TextStyle(color: Color(0xFF323B60))),
          ),
          FlashyTabBarItem(
            icon: const Icon(Icons.post_add, color: Color(0xFF4F709C)),
            title: const Text('Posts', style: TextStyle(color: Color(0xFF323B60))),
          ),
          FlashyTabBarItem(
            icon: const Icon(
              Icons.assured_workload,
              color: Color(0xFF4F709C),
            ),
            title:
                const Text('Bookings', style: TextStyle(color: Color(0xFF323B60))),
          ),
          FlashyTabBarItem(
            icon: const Icon(
              Icons.person,
              color: Color(0xFF4F709C),
            ),
            title: const Text("Profile", style: TextStyle(color: Color(0xFF323B60))),
          ),
        ],
      ),
    );
  }
}
