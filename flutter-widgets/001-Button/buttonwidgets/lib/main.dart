import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Button Widgets',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyWidget(),
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Button Widgets'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Default Buttons'),

                ///Spacer
                const SizedBox(
                  height: 18,
                ),

                ///Text Button
                TextButton(
                  onPressed: () {},
                  child: const Text('Text Button'),
                ),

                ///Spacer
                const SizedBox(
                  height: 18,
                ),

                ///Eleveted Button
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Elevetad Button'),
                ),

                ///Spacer
                const SizedBox(
                  height: 18,
                ),

                ///Outlined Button
                OutlinedButton(
                  onPressed: () => {},
                  child: const Text('Outlined Button'),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Custom Buttons'),

                ///Spacer
                const SizedBox(
                  height: 18,
                ),

                ///Text Button
                TextButton(
                  style: ButtonStyle(
                    backgroundColor:
                        const MaterialStatePropertyAll<Color>(Colors.grey),
                    foregroundColor:
                        const MaterialStatePropertyAll<Color>(Colors.black),
                    shape: MaterialStatePropertyAll<OutlinedBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    )),
                  ),
                  onPressed: () {},
                  child: const Text('Text Button'),
                ),

                ///Spacer
                const SizedBox(
                  height: 18,
                ),

                ///Eleveted Button
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        const MaterialStatePropertyAll<Color>(Colors.grey),
                    foregroundColor:
                        const MaterialStatePropertyAll<Color>(Colors.black),
                    elevation: const MaterialStatePropertyAll<double>(0.0),
                    shape: MaterialStatePropertyAll<OutlinedBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    )),
                  ),
                  onPressed: () {},
                  child: const Text('Elevetad Button'),
                ),

                ///Spacer
                const SizedBox(
                  height: 18,
                ),

                ///Outlined Button
                OutlinedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        const MaterialStatePropertyAll<Color>(Colors.grey),
                    foregroundColor:
                        const MaterialStatePropertyAll<Color>(Colors.black),
                    side: const MaterialStatePropertyAll<BorderSide>(
                      BorderSide(
                        color: Colors.blue,
                      ),
                    ),
                    shape: MaterialStatePropertyAll<OutlinedBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    )),
                  ),
                  onPressed: () => {},
                  child: const Text('Outlined Button'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
