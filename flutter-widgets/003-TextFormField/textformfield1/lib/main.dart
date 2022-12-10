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
      title: 'TextFormField Widget',
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
  ///Creating Controllers
  late final TextEditingController _textController1;
  late final TextEditingController _textController2;
  late final TextEditingController _textController3;

  ///override initState to initialize the controllers
  @override
  void initState() {
    _textController1 = TextEditingController();
    _textController2 = TextEditingController();
    _textController3 = TextEditingController();
    super.initState();
  }

  ///override dispose to dipose the controller
  @override
  void dispose() {
    _textController1.dispose();
    _textController2.dispose();
    _textController3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TextFormField Widget'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ///Plain or normal TextFormField
            TextFormField(
              controller: _textController1,
              decoration: const InputDecoration(
                labelText: 'TextFormField',
              ),
            ),

            ///Spacer
            const SizedBox(
              height: 30,
            ),

            ///Customize TextFormField
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: TextFormField(
                controller: _textController2,
                cursorColor: Colors.green,
                decoration: InputDecoration(
                  labelText: 'TextFormField',
                  labelStyle: const TextStyle(
                    color: Colors.green,
                  ),
                  prefixIcon: const Icon(
                    Icons.text_fields,
                    color: Colors.green,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                      color: Colors.green,
                      width: 0.5,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                      color: Colors.green,
                      width: 0.5,
                    ),
                  ),
                ),
              ),
            ),

            ///Spacer
            const SizedBox(
              height: 30,
            ),

            ///A Combination of widget to customize a textformfield
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.greenAccent,
                              blurRadius: 20,
                              spreadRadius: -5,
                            ),
                          ],
                          gradient: const LinearGradient(
                            begin: Alignment.center,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color.fromARGB(255, 178, 238, 180),
                              Colors.greenAccent,
                              Colors.blueAccent,
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: TextFormField(
                        controller: _textController3,
                        cursorColor: Colors.black,
                        decoration: const InputDecoration(
                          labelText: 'TextFormField',
                          labelStyle: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
