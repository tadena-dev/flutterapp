import 'package:flutter/material.dart';
import 'package:friendlister/pages/friendlist_page.dart';
import 'package:friendlister/pages/home_page.dart';
import 'package:friendlister/pages/signin_page.dart';
import 'package:friendlister/pages/signup_page.dart';
import 'package:friendlister/utils/constant.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  await Supabase.initialize(
    url: '',
    anonKey: '',
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: customAppTheme,
      initialRoute: client.auth.currentSession != null ? '/friendlist' : '/',
      routes: {
        '/': (context) => const HomePage(),
        '/signin': (context) => const SignInPage(),
        '/signup': (context) => const SignUpPage(),
        '/friendlist': (context) => const FriendListPage(),
      },
    );
  }
}
