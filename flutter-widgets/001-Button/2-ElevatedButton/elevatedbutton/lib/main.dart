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
      title: 'Elevated Button Widget',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyWidget(),
    );
  }
}

///Create a Stateful widget called MyWidget
///this will be our home page or root page.
///Replace the Container with Scaffold widget
///give it a title under the appbar.
///Supply a body with Center widget with a child
///of Column widget then set the main axis alignment
///to center then invoke the children for the column widget.
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
        title: const Text('Elevated Button Widget'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          ///Create Text Button where we can manipulate
          ///its UI in defferent ways
          ///First - A plain Text Button Widget
          ///Second - Customize the Button Style
          ///Third - Customize the TextButton.styleFrom()
          ///Fourth - Customize in other ways
          children: [
            ///Plain Text Button
            ElevatedButton(
              onPressed: () {},
              child: const Text('ElevatedButton'),
            ),

            ///Spacer
            const SizedBox(
              height: 30,
            ),

            ///Customize Button Style of Text Button
            ///Acc
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    const MaterialStatePropertyAll<Color>(Colors.grey),
                foregroundColor:
                    const MaterialStatePropertyAll<Color>(Colors.white),
                shape: MaterialStatePropertyAll<OutlinedBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                fixedSize: const MaterialStatePropertyAll<Size>(
                  Size(150, 40),
                ),
              ),
              onPressed: () {},
              child: const Text('ElevatedButton'),
            ),

            ///Spacer
            const SizedBox(
              height: 30,
            ),

            ///Customize with TextButton.styleFrom()
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                fixedSize: const Size(150, 40),
              ),
              onPressed: () {},
              child: const Text('ElevatedButton'),
            ),

            ///Spacer
            const SizedBox(
              height: 30,
            ),

            ///Customize Text Button
            ///Creating a ClipRRect to access the borderRadius
            ///with a child of Stack widget to stack
            ///container widget and the textbutton widget.
            ///The reason for this is we have variety of
            ///option on how we decorate our container.
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.deepPurpleAccent,
                            blurRadius: 20,
                            spreadRadius: -5,
                          ),
                        ],
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color.fromARGB(255, 252, 85, 244),
                            Color.fromARGB(255, 130, 250, 83),
                            Color.fromARGB(255, 80, 197, 252),
                          ],
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    ///Change a few default value of the ElevatedButton
                    ///to display the Container widget
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      elevation: 0,
                      fixedSize: const Size(150, 40),
                    ),
                    onPressed: () {},
                    child: const Text(
                      'ElevatedButton',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
