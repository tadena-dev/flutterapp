import 'package:flutter/material.dart';

final customTheme = ThemeData(
  tabBarTheme: const TabBarTheme(
    labelColor: Colors.black,
    unselectedLabelColor: Colors.greenAccent,
    indicator: BoxDecoration(
      shape: BoxShape.circle,
      boxShadow: [
        BoxShadow(
          color: Colors.redAccent,
          blurRadius: 20,
          spreadRadius: 0.5,
        ),
      ],
      gradient: LinearGradient(
        begin: Alignment.center,
        end: Alignment.bottomCenter,
        colors: [
          Colors.lightBlue,
          Colors.lightGreen,
          Colors.pinkAccent,
        ],
      ),
    ),
  ),
);
