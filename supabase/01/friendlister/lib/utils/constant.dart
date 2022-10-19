import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// [client] supabase instance
final client = Supabase.instance.client;

/// small Gap
const smallGap = SizedBox(height: 15);

/// medium Gap
const mediumGap = SizedBox(height: 30);

/// larger Gap
const largeGap = SizedBox(height: 45);

/// Customize ThemeData
final customAppTheme = ThemeData.dark().copyWith(
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.transparent,
    elevation: 0,
  ),

  /// Background color for scaffold
  scaffoldBackgroundColor: Colors.blueGrey,

  /// Customize style for OutlinedButton
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: Colors.lightBlueAccent,
      side: const BorderSide(
        color: Colors.white54,
        width: 0.5,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(16),
      textStyle: GoogleFonts.montserrat(),
    ),
  ),

  /// Customize style for InputDecoration
  inputDecorationTheme: InputDecorationTheme(
    labelStyle: const TextStyle(color: Colors.white54),
    focusColor: Colors.blueAccent,
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        color: Colors.white54,
        width: 0.5,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        color: Colors.lightBlueAccent,
        width: 0.5,
      ),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  ),

  /// Customize body TextTheme color
  textTheme: const TextTheme(
    bodyText1: TextStyle(color: Colors.white54),
    bodyText2: TextStyle(color: Colors.white54),
  ),
);

/// Customize SnackBar
extension ShowSnackBar on BuildContext {
  void showErrorSnackBar(String message) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(color: Colors.redAccent),
        ),
        backgroundColor: Colors.grey,
      ),
    );
  }
}
