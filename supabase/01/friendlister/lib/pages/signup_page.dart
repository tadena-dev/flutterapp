import 'package:flutter/material.dart';
import 'package:friendlister/utils/constant.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  /// Initialize controller for email and password
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  /// [createAccount] function that handles account creations
  Future<bool> createAccounte({
    required final String email,
    required final String password,
  }) async {
    final response = await client.auth.signUp(
      email,
      password,
    );
    final error = response.error;
    if (error == null) {
      return true;
    } else {
      return false;
    }
  }

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
              Icons.android_rounded,
              size: 200,
              color: Colors.white70,
            ),
            smallGap,

            /// Text
            Text(
              'Sign Up',
              style: GoogleFonts.inspiration(
                color: Colors.lightBlueAccent,
                fontSize: 60,
              ),
              textAlign: TextAlign.center,
            ),
            largeGap,

            /// Email InputField
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  label: Text('Email'),
                ),
              ),
            ),
            smallGap,

            /// Password InputField
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  label: Text('Password'),
                ),
                obscureText: true,
              ),
            ),
            mediumGap,

            /// Sign-Up Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60),
              child: OutlinedButton(
                onPressed: () async {
                  final creationValue = await createAccounte(
                    email: _emailController.text,
                    password: _passwordController.text,
                  );
                  if (creationValue == true) {
                    Navigator.pushReplacementNamed(
                      context,
                      '/signin',
                    );
                    context.showErrorSnackBar('Success!');
                  }
                },
                child: const Text('Sign Up'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
