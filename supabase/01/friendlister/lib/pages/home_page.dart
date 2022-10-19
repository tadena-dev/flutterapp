import 'package:flutter/material.dart';
import 'package:friendlister/utils/constant.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            /// Icon
            const Icon(
              Icons.android_outlined,
              size: 200,
              color: Colors.white70,
            ),
            smallGap,

            /// Text
            Text(
              'Friend Lister',
              style: GoogleFonts.inspiration(
                color: Colors.lightBlueAccent,
                fontSize: 60,
              ),
              textAlign: TextAlign.center,
            ),
            largeGap,

            /// Sign-In Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: OutlinedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/signin');
                },
                child: const Text('Sign-In'),
              ),
            ),
            mediumGap,

            /// Sign-Up Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: OutlinedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/signup');
                },
                child: const Text('Sign-Up'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
