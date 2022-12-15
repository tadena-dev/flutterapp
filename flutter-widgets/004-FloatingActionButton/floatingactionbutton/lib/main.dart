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
      title: 'FloatingActionButton',
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
        title: const Text('FloatingActionButton'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ///default floatingactionbutton
            FloatingActionButton(
              onPressed: () {},
              child: const Icon(Icons.add),
            ),

            ///spacer
            const SizedBox(
              height: 10,
            ),

            ///1st - custom ui
            FloatingActionButton(
              backgroundColor: Colors.grey,
              hoverColor: Colors.black,
              shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(30),
                side: const BorderSide(
                  color: Colors.black,
                  width: 0.5,
                ),
              ),
              onPressed: () {},
              child: const Icon(Icons.add),
            ),

            ///spacer
            const SizedBox(
              height: 10,
            ),

            ///2nd custom floatingactionbutton
            Stack(
              children: [
                Positioned.fill(
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.blueAccent,
                            blurRadius: 10,
                            spreadRadius: 1.0),
                      ],
                      gradient: LinearGradient(
                        begin: Alignment.center,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.pinkAccent,
                          Colors.blueAccent,
                        ],
                      ),
                    ),
                  ),
                ),
                FloatingActionButton(
                  backgroundColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  elevation: 0,
                  focusElevation: 0,
                  highlightElevation: 0,
                  hoverElevation: 0,
                  disabledElevation: 0,
                  onPressed: () {},
                  child: const Icon(
                    Icons.add,
                    color: Colors.black,
                  ),
                ),
              ],
            ),

            ///spacer
            const SizedBox(
              height: 10,
            ),

            ///3rd custom floatingactionbutton
            FloatingActionButton(
              backgroundColor: Colors.transparent,
              onPressed: () {},
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.red,
                          blurRadius: 10,
                          spreadRadius: -2,
                        ),
                      ],
                      gradient: LinearGradient(
                        colors: [
                          Colors.lightBlueAccent,
                          Colors.lightGreenAccent,
                          Colors.redAccent,
                        ],
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.add,
                    color: Colors.black,
                  ),
                ],
              ),
            ),

            ///spacer
            const SizedBox(
              height: 10,
            ),

            ///small floatingAction
            FloatingActionButton.small(
              backgroundColor: Colors.transparent,
              onPressed: () {},
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.red,
                          blurRadius: 10,
                          spreadRadius: -2,
                        ),
                      ],
                      gradient: LinearGradient(
                        colors: [
                          Colors.lightBlueAccent,
                          Colors.lightGreenAccent,
                          Colors.redAccent,
                        ],
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.add,
                    color: Colors.black,
                  ),
                ],
              ),
            ),

            ///spacer
            const SizedBox(
              height: 10,
            ),

            ///large floatingActionbutton
            FloatingActionButton.large(
              backgroundColor: Colors.transparent,
              onPressed: () {},
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.red,
                          blurRadius: 10,
                          spreadRadius: -2,
                        ),
                      ],
                      gradient: LinearGradient(
                        colors: [
                          Colors.lightBlueAccent,
                          Colors.lightGreenAccent,
                          Colors.redAccent,
                        ],
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.add,
                    color: Colors.black,
                  ),
                ],
              ),
            ),

            ///spacer
            const SizedBox(
              height: 10,
            ),

            ///floatingactionbutton extended
            FloatingActionButton.extended(
              onPressed: () {},
              label: const Text('Accept'),
              icon: const Icon(Icons.thumb_up),
            ),

            ///spacer
            const SizedBox(
              height: 10,
            ),

            ///floatinactionbutton extended customize
            FloatingActionButton.extended(
              onPressed: () {},
              label: const Text('Accept'),
              icon: const Icon(Icons.thumb_up),
              backgroundColor: Colors.blueGrey,
              foregroundColor: Colors.greenAccent,
              hoverColor: Colors.redAccent,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
              ),
              tooltip: 'FloatingActionButton Extended',
            ),
          ],
        ),
      ),
    );
  }
}
