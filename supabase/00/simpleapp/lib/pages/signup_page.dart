import 'package:flutter/material.dart';
import 'package:simpleapp/utils/constant.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  /// Initialize controllers
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  /// [createUser] function that handles user creation
  Future<bool> createUser({
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ///Icon
            const Icon(
              Icons.sailing_rounded,
              size: 150,
              color: Colors.blue,
            ),
            largeGap,

            ///Email Input
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

            ///Password Input

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
            largeGap,

            ///SignUp Button
            OutlinedButton(
              onPressed: () async {
                final userValue = await createUser(
                    email: _emailController.text,
                    password: _passwordController.text);
                if (userValue == true) {
                  Navigator.pushReplacementNamed(context, '/signin');
                  context.showErrorMessage('Success');
                }
              },
              child: const Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}
