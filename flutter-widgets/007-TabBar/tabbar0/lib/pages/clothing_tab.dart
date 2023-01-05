import 'package:flutter/material.dart';

class ClothingTab extends StatelessWidget {
  const ClothingTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('Clothing Tab'),
          ],
        ),
      ),
    );
  }
}
