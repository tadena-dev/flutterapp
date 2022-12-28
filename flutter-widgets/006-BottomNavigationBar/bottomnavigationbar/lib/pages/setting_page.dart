import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Setting Page',
              style: TextStyle(
                color: Colors.blueGrey,
                fontSize: 50,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
