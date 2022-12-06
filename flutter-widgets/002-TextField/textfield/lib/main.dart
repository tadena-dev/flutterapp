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
      title: 'Text Field Widget',
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

///Create TextEditingController for each TextFields
///this controller will hold the input texts
class _MyWidgetState extends State<MyWidget> {
  late TextEditingController _normalTextField;
  late TextEditingController _customTextField;
  late TextEditingController _anotherCustomTextField;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    _normalTextField = TextEditingController();
    _customTextField = TextEditingController();
    _anotherCustomTextField = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _normalTextField.dispose();
    _customTextField.dispose();
    _anotherCustomTextField.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TextField Widget'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ///A normal TextField widget
            TextField(
              controller: _normalTextField,
              decoration: const InputDecoration(
                labelText: 'Normal TextField',
              ),
            ),

            ///Spacer
            const SizedBox(
              height: 30,
            ),

            ///Customize TextField widget
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TextField(
                controller: _customTextField,
                cursorColor: Colors.grey,
                decoration: InputDecoration(
                  labelText: 'Custom TextField',
                  labelStyle: const TextStyle(
                    color: Colors.grey,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                      width: 0.5,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                      width: 0.5,
                    ),
                  ),
                  focusColor: Colors.grey,
                ),
              ),
            ),

            ///Spacer
            const SizedBox(
              height: 30,
            ),

            ///Another Customize TextField
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
                              color: Colors.deepPurpleAccent,
                              blurRadius: 20,
                              spreadRadius: -5,
                            ),
                          ],
                          gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Colors.blueAccent,
                              Colors.redAccent,
                              Colors.greenAccent,
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: TextField(
                        controller: _anotherCustomTextField,
                        cursorColor: Colors.black,
                        decoration: const InputDecoration(
                          labelText: 'Another Custom TextField',
                          labelStyle: TextStyle(
                            color: Colors.black,
                          ),
                          focusColor: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            ///Spacer
            const SizedBox(
              height: 30,
            ),

            ///Email TextField
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
                              color: Colors.deepPurpleAccent,
                              blurRadius: 20,
                              spreadRadius: -5,
                            ),
                          ],
                          gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Colors.blueAccent,
                              Colors.redAccent,
                              Colors.greenAccent,
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: TextField(
                        controller: _emailController,
                        cursorColor: Colors.black,
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          labelStyle: TextStyle(
                            color: Colors.black,
                          ),
                          focusColor: Colors.black,
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            ///Spacer
            const SizedBox(
              height: 30,
            ),

            ///Email TextField
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
                              color: Colors.deepPurpleAccent,
                              blurRadius: 20,
                              spreadRadius: -5,
                            ),
                          ],
                          gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Colors.blueAccent,
                              Colors.redAccent,
                              Colors.greenAccent,
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: TextField(
                        controller: _passwordController,
                        cursorColor: Colors.black,
                        decoration: const InputDecoration(
                          labelText: 'Password',
                          labelStyle: TextStyle(
                            color: Colors.black,
                          ),
                          focusColor: Colors.black,
                        ),
                        obscureText: true,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: ((context) {
              return AlertDialog(
                title: const Text('TextField Widget'),
                content: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Normal TextField: ${_normalTextField.text}'),
                      Text('Custom TextField: ${_customTextField.text}'),
                      Text(
                          'Another Custom TextField: ${_anotherCustomTextField.text}'),
                      Text('Email: ${_emailController.text}'),
                      Text('Password: ${_passwordController.text}'),
                    ],
                  ),
                ),
              );
            }),
          );
        },
        child: const Icon(Icons.text_fields),
      ),
    );
  }
}
