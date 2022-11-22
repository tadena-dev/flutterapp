import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

///initialize a supabase instance client called [client]
final client = Supabase.instance.client;

///[showSnackBar] custom snackbar
extension ShowSnackBar on BuildContext {
  void showSnackBar(String text) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(
          text,
          style: const TextStyle(
            color: Colors.redAccent,
          ),
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}
