import 'package:bottomnavigationbar/navigation/bottom_nav.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BottomNavigationBar',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const BottomNavigation(),
    );
  }
}
