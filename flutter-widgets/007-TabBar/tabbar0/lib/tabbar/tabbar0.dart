import 'package:flutter/material.dart';
import 'package:tabbar0/pages/clothing_tab.dart';
import 'package:tabbar0/pages/food_tab.dart';
import 'package:tabbar0/pages/mobile_tab.dart';

class TabBar0 extends StatefulWidget {
  const TabBar0({super.key});

  @override
  State<TabBar0> createState() => _TabBar0State();
}

class _TabBar0State extends State<TabBar0> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(
      length: 3,
      vsync: this,
      animationDuration: const Duration(seconds: 1),
    );
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TabBar Widget'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(
              text: 'Clothing',
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
      body: TabBarView(
        controller: _tabController,
        children: const [
          ClothingTab(),
          FoodTab(),
          MobileTab(),
        ],
      ),
    );
  }
}
