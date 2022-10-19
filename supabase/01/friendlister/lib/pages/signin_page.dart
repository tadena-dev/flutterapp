import 'package:flutter/material.dart';
import 'package:friendlister/utils/constant.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  /// Initilize controller for email and password
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isLoading = false;

  /// [loginUser] function for login user if exist or not
  Future<String?> loginUser({
    required final String email,
    required final String password,
  }) async {
    final response = await client.auth.signIn(
      email: email,
      password: password,
    );
    final user = response.data?.user;
    return user?.id;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ///Icon
            const Icon(
              Icons.android_rounded,
              size: 200,
              color: Colors.white70,
            ),
            smallGap,

            ///Text
            Text(
              'Sign In',
              style: GoogleFonts.inspiration(
                color: Colors.lightBlueAccent,
                fontSize: 70,
              ),
              textAlign: TextAlign.center,
            ),
            largeGap,

            ///Email Text Field
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  label: Text('Email'),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            smallGap,

            ///Password Text Field
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  label: Text('Password'),
                ),
                obscureText: true,
              ),
            ),
            mediumGap,

            ///Sign-In Button
            isLoading
                ? Container(
                    height: 30,
                    width: 30,
                    decoration: const BoxDecoration(
                      color: Colors.blueGrey,
                    ),
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 60),
                    child: OutlinedButton(
                      onPressed: () async {
                        setState(() {
                          isLoading = true;
                        });
                        dynamic loginValue = await loginUser(
                            email: _emailController.text,
                            password: _passwordController.text);
                        setState(() {
                          isLoading = false;
                        });
                        if (loginValue != null) {
                          Navigator.pushReplacementNamed(
                            context,
                            '/friendlist',
                          );
                        } else {
                          context
                              .showErrorSnackBar('Invalid Email or Password');
                        }
                      },
                      child: const Text('Sign In'),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
