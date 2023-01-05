import 'package:flutter/material.dart';
import 'package:tabbar0/pages/clothing_tab.dart';
import 'package:tabbar0/pages/food_tab.dart';
import 'package:tabbar0/pages/mobile_tab.dart';

class TabBarWidget extends StatelessWidget {
  const TabBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      animationDuration: const Duration(seconds: 1),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('TabBar Widget'),
          bottom: const TabBar(
            tabs: [
              Tab(
                text: 'Shop',
                icon: Icon(Icons.shop),
              ),
              Tab(
                text: 'Food',
                icon: Icon(Icons.food_bank),
              ),
              Tab(
                text: 'Mobile',
                icon: Icon(Icons.mobile_friendly),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            ClothingTab(),
            FoodTab(),
            MobileTab(),
          ],
        ),
      ),
    );
  }
}
