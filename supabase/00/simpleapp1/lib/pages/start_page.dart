import 'package:flutter/material.dart';
import 'package:simpleapp1/utils/common.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  bool _signInLoading = false;
  bool _signUpLoading = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 20,
                left: 40,
                right: 40,
                bottom: 10,
              ),
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please fill in email address';
                  }
                  return null;
                },
                controller: _emailController,
                decoration: const InputDecoration(
                  label: Text('Email'),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 20,
                left: 40,
                right: 40,
                bottom: 10,
              ),
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please fill in password';
                  }
                  return null;
                },
                controller: _passwordController,
                decoration: const InputDecoration(
                  label: Text('Password'),
                ),
                obscureText: true,
              ),
            ),
            _signInLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Padding(
                    padding: const EdgeInsets.only(
                      top: 20,
                      left: 40,
                      right: 40,
                      bottom: 10,
                    ),
                    child: OutlinedButton(
                      onPressed: () async {
                        final isValid = _formKey.currentState?.validate();
                        if (isValid != true) {
                          return;
                        }
                        setState(() {
                          _signInLoading = true;
                        });
                        try {
                          await client.auth.signInWithPassword(
                            email: _emailController.text,
                            password: _passwordController.text,
                          );
                        } catch (e) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text('Login failed'),
                            backgroundColor: Colors.red,
                          ));
                          setState(() {
                            _signInLoading = false;
                          });
                        }
                      },
                      child: const Text('Sign-In'),
                    ),
                  ),
            _signUpLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Padding(
                    padding: const EdgeInsets.only(
                      top: 20,
                      left: 40,
                      right: 40,
                      bottom: 10,
                    ),
                    child: OutlinedButton(
                      onPressed: () async {
                        final isValid = _formKey.currentState?.validate();
                        if (isValid != true) {
                          return;
                        }
                        setState(() {
                          _signUpLoading = true;
                        });

                        try {
                          await client.auth.signUp(
                            email: _emailController.text,
                            password: _passwordController.text,
                          );
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text('Sucessful. Confirm your Account'),
                            backgroundColor: Colors.red,
                          ));
                        } catch (e) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text('Sign Up failed'),
                            backgroundColor: Colors.red,
                          ));
                        }

                        setState(() {
                          _signUpLoading = false;
                        });
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
