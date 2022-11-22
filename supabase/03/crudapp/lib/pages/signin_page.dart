import 'package:crudapp/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  ///initialize the additional controller
  ///_emailController & _passwordController
  ///_formKey for Validation
  ///_isLoading for loading
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  ///[_signIn] a sign in functionality
  Future<void> _signIn({
    required final email,
    required final password,
  }) async {
    setState(() {
      _isLoading = true;
    });

    ///try catch block to catch the AuthException
    try {
      await client.auth.signInWithPassword(
        email: email,
        password: password,
      );
      if (mounted) {
        Navigator.popAndPushNamed(context, '/home');
      }
    } on AuthException catch (error) {
      context.showSnackBar(error.message);
    } catch (error) {
      context.showSnackBar('Unexpected error occured');
    }

    setState(() {
      _isLoading = false;
    });
  }

  ///[dispose] override this function and
  ///add additional controllers to dispose it
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please fill up with correct email address';
                    }
                    return null;
                  },
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please fill up with correct password';
                    }
                    return null;
                  },
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                  ),
                  obscureText: true,
                ),
                const SizedBox(
                  height: 20,
                ),
                _isLoading
                    ? const SizedBox(
                        child: CircularProgressIndicator(),
                      )
                    : OutlinedButton(
                        onPressed: () {
                          final isValid = _formKey.currentState?.validate();

                          if (isValid != true) {
                            return;
                          }

                          final res = _signIn(
                            email: _emailController.text,
                            password: _passwordController.text,
                          );
                          res.then((value) {
                            _emailController.clear();
                            _passwordController.clear();
                          });
                        },
                        child: const Text('Sign-in'),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
