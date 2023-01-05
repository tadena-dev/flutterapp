import 'package:flutter/material.dart';

class MobileTab extends StatelessWidget {
  const MobileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('Mobile Tab'),
          ],
        ),
      ),
    );
  }
}
