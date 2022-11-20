import 'package:flutter/material.dart';
import 'package:mydiaryapp/pages/diary_page.dart';
import 'package:mydiaryapp/pages/home_page.dart';
import 'package:mydiaryapp/pages/signin_page.dart';
import 'package:mydiaryapp/pages/signup_page.dart';
import 'package:mydiaryapp/utils/utils.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://pasrxukztoktskfwvdcr.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InBhc3J4dWt6dG9rdHNrZnd2ZGNyIiwicm9sZSI6ImFub24iLCJpYXQiOjE2Njg5MjM2OTMsImV4cCI6MTk4NDQ5OTY5M30.Sk3ob0w6SGyq6ZSYBnxXAFpKZ_Rg6CvD04ByotUJ3rM',
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Diary App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: client.auth.currentSession != null ? '/home' : '/',
      routes: {
        '/': (context) => const StartPage(),
        '/home': (context) => const HomePage(),
        '/diary': (context) => const DiaryPage(),
        '/signin': (context) => const SignInPage(),
        '/signup': (context) => const SignUpPage(),
      },
    );
  }
}

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Welcome',
              style: TextStyle(
                fontSize: 25,
              ),
              textAlign: TextAlign.center,
            ),
            OutlinedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/signin');
              },
              child: const Text('Sign-in'),
            ),
            OutlinedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/signup');
              },
              child: const Text('Sign-up'),
            ),
          ],
        ),
      ),
    );
  }
}
