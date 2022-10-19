import 'package:flutter/material.dart';
import 'package:simpleapp/pages/home_page.dart';
import 'package:simpleapp/pages/signin_page.dart';
import 'package:simpleapp/pages/signup_page.dart';
import 'package:simpleapp/pages/simpleapp_page.dart';
import 'package:simpleapp/utils/constant.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  await Supabase.initialize(
    url: '',
    anonKey:
        '',
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Simple App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: client.auth.currentSession != null ? '/simpleapp' : '/',
      routes: {
        '/': (context) => const HomePage(),
        '/signin': (context) => const SignInPage(),
        '/signup': (context) => const SignUpPage(),
        '/simpleapp': (context) => const SimpleAppPage(),
      },
    );
  }
}
