import 'package:bottomnavigationbar/pages/home_page.dart';
import 'package:bottomnavigationbar/pages/profile_page.dart';
import 'package:bottomnavigationbar/pages/setting_page.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _pageIndex = 1;

  static const List<Widget> _pageSelection = [
    SettingPage(),
    HomePage(),
    ProfilePage(),
  ];

  void _pageTapped(int index) {
    setState(() {
      _pageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageSelection.elementAt(_pageIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Setting',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _pageIndex,
        onTap: _pageTapped,
        selectedItemColor: Colors.redAccent,
        selectedIconTheme: const IconThemeData(
          color: Colors.red,
          shadows: [
            BoxShadow(
              color: Colors.red,
              blurRadius: 7,
              spreadRadius: -2,
            ),
          ],
        ),
        unselectedIconTheme: const IconThemeData(
          shadows: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 7,
              spreadRadius: -2,
            ),
          ],
        ),
      ),
    );
  }
}
