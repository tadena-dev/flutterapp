import 'package:flutter/material.dart';
import 'package:magiclink/utils/utils.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool _redirectCalled = false;

  ///2nd override the didChangeDependecies()
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _redirect();
  }

  ///1st Create [_redirect] function
  Future<void> _redirect() async {
    await Future.delayed(const Duration(seconds: 5));
    if (_redirectCalled || !mounted) {
      return;
    }

    _redirectCalled = true;
    final session = supabase.auth.currentSession;
    if (session != null) {
      Navigator.of(context).pushReplacementNamed('/account');
    } else {
      Navigator.of(context).pushReplacementNamed('/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
