import 'package:flutter/material.dart';
import 'package:simpleapp1/pages/home_page.dart';
import 'package:simpleapp1/pages/signin_page.dart';
import 'package:simpleapp1/pages/signup_page.dart';
import 'package:simpleapp1/pages/start_page.dart';
import 'package:simpleapp1/utils/common.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  await Supabase.initialize(
    url: 'https://dunfrphhckjwvgmvunnf.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImR1bmZycGhoY2tqd3ZnbXZ1bm5mIiwicm9sZSI6ImFub24iLCJpYXQiOjE2Njc2MDU4MzcsImV4cCI6MTk4MzE4MTgzN30.nL5qwDx__v_U8oAAIdnVgk3lc7M096UQkk5EcygNK-g',
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Supabase V1 app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyWidget(),
      routes: {
        '/signin': (context) => const SignInPage(),
        '/signup': (context) => const SignUpPage(),
      },
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  User? _user;

  @override
  void initState() {
    _getAuth();
    super.initState();
  }

  Future<void> _getAuth() async {
    setState(() {
      _user = client.auth.currentUser;
    });
    client.auth.onAuthStateChange.listen((event) {
      setState(() {
        _user = event.session?.user;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Supabase flutter V1'),
      ),
      body: _user == null ? const StartPage() : const HomePage(),
    );
  }
}
