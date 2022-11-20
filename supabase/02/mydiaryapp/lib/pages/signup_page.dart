import 'package:flutter/material.dart';
import 'package:mydiaryapp/utils/utils.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _isLoading = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Future<void> _signUp({
    required final email,
    required final password,
  }) async {
    final isValid = _formKey.currentState?.validate();
    if (isValid != true) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      await client.auth.signUp(
        email: email,
        password: password,
      );
      if (mounted) {
        Navigator.pushNamed(context, '/signin');
        context.showErrorSnackBar('Confirm your account.');
      }
    } on AuthException catch (error) {
      context.showErrorSnackBar(error.message);
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please fill in Email';
                  }
                  return null;
                },
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please fill in Password';
                  }
                  return null;
                },
                controller: _passwordController,
                decoration: const InputDecoration(
                  labelText: 'Password',
                ),
                obscureText: true,
              ),
              OutlinedButton(
                onPressed: () {
                  _isLoading
                      ? null
                      : _signUp(
                          email: _emailController.text,
                          password: _passwordController.text,
                        );
                },
                child: const Text('Sign-up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
