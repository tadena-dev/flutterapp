import 'package:flutter/material.dart';
import 'package:mydiaryapp/utils/utils.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool _isLoading = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Future<void> _signIn({
    required final email,
    required final password,
  }) async {
    setState(() {
      _isLoading = true;
    });

    try {
      await client.auth.signInWithPassword(
        email: email,
        password: password,
      );
    } on AuthException catch (error) {
      context.showErrorSnackBar(error.message);
    } catch (error) {
      context.showErrorSnackBar('Unexpected error occured');
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
                    return 'Please fill in email address';
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
                    return 'Please fill in password';
                  }
                  return null;
                },
                controller: _passwordController,
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
              OutlinedButton(
                onPressed: () {
                  _isLoading
                      ? null
                      : _signIn(
                          email: _emailController.text,
                          password: _passwordController.text,
                        );
                  _emailController.clear();
                  _passwordController.clear();
                },
                child: const Text('Sign-in'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
