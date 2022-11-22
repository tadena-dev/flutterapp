import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:crudapp/pages/home_page.dart';
import 'package:crudapp/pages/signin_page.dart';
import 'package:crudapp/pages/signip_page.dart';
import 'package:crudapp/utils/utils.dart';

///[main] it will be a Future and async
///In dart Future works really well with async
Future<void> main() async {
  ///Binding with widgetsflutterbingdings
  ///to ensure the initialization of supabase
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://xrkvenczpvcjpcqlqbew.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inhya3ZlbmN6cHZjanBjcWxxYmV3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2NjkwODA1MjEsImV4cCI6MTk4NDY1NjUyMX0.Q2G8NV2Zgv6lSPTa6T90RDctMvlvOncMEHQeXQCsNgk',
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
      title: 'Simple CRUD App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: client.auth.currentSession != null ? '/home' : '/',
      routes: {
        '/': (context) => const MyWidget(),
        '/home': (context) => const HomePage(),
        '/signin': (context) => const SignInPage(),
        '/signup': (context) => const SignUpPage(),
      },
    );
  }
}

///Create stf widget will have
///Text
///sign-in button
///sign-up button
class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
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
          ],
        ),
      ),
    );
  }
}
