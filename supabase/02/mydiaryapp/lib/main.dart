import 'package:flutter/material.dart';
import 'package:mydiaryapp/pages/home_page.dart';
import 'package:mydiaryapp/pages/signin_page.dart';
import 'package:mydiaryapp/pages/signup_page.dart';
import 'package:mydiaryapp/utils/utils.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

///[main] as Future and make it an async
///In dart Future works really well with async
Future<void> main() async {
  ///This binding will ensure the initialization of Supabase
  WidgetsFlutterBinding.ensureInitialized();

  ///Initialize the Supabase and supply with url and anonKey
  await Supabase.initialize(
    url: '',
    anonKey: '',
  );

  runApp(const MyApp());
}

///initialRoutes
///routes
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
        '/signin': (context) => const SignInPage(),
        '/signup': (context) => const SignUpPage(),
      },
    );
  }
}

///this stf widget will have
///Text
///Sign-in Button
///Sign-up Button
///it will navigate to its specify pages
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
            const Padding(
              padding: EdgeInsets.only(bottom: 40),
              child: Text(
                'Welcome',
                style: TextStyle(
                  fontSize: 25,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: OutlinedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/signin');
                },
                child: const Text(
                  'Sign-in',
                  style: TextStyle(
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: OutlinedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/signup');
                },
                child: const Text(
                  'Sign-up',
                  style: TextStyle(
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
