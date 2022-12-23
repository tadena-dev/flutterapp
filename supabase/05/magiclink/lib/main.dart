import 'package:flutter/material.dart';
import 'package:magiclink/pages/account_page.dart';
import 'package:magiclink/pages/login_page.dart';
import 'package:magiclink/pages/splash_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://tieoqyhktmetosnmvrez.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRpZW9xeWhrdG1ldG9zbm12cmV6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzE3ODYwMjQsImV4cCI6MTk4NzM2MjAyNH0.Fnq97bpQ8vYp4ZtqvaMMa9GYiCrntxwIf2wKf61qGGQ',
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Magic Link',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashPage(),
        '/login': (context) => const LoginPage(),
        '/account': (context) => const AccountPage(),
      },
    );
  }
}
