import 'package:flutter/material.dart';
//import 'package:tabbar0/tabbar/tabbar.dart';
import 'package:tabbar0/tabbar/tabbar0.dart';
import 'package:tabbar0/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: customTheme,
      home: const TabBar0(),
    );
  }
}
