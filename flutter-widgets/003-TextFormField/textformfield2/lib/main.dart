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
  ///Create controllers and formkey
  late final TextEditingController _nameController;
  late final TextEditingController _usernameController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  final _formKey = GlobalKey<FormState>();

  ///override initState then initialize the controllers
  @override
  void initState() {
    _nameController = TextEditingController();
    _usernameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  ///override dispose to dispose the controller
  @override
  void dispose() {
    _nameController.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TextFormField Widget'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ///Name
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please fill with your name.';
                    }
                    return null;
                  },
                  controller: _nameController,
                  cursorColor: Colors.blueGrey,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    labelStyle: const TextStyle(
                      color: Colors.blueGrey,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        color: Colors.blueGrey,
                        width: 0.5,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        color: Colors.blueGrey,
                        width: 0.5,
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.name,
                ),

                ///Spacer
                const SizedBox(
                  height: 20,
                ),

                ///Username
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please fill with your Username.';
                    }
                    return null;
                  },
                  controller: _usernameController,
                  cursorColor: Colors.blueGrey,
                  decoration: InputDecoration(
                    labelText: 'Username',
                    labelStyle: const TextStyle(
                      color: Colors.blueGrey,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        color: Colors.blueGrey,
                        width: 0.5,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        color: Colors.blueGrey,
                        width: 0.5,
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.text,
                ),

                ///Spacer
                const SizedBox(
                  height: 20,
                ),

                ///Email
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please fill with your Email.';
                    }
                    return null;
                  },
                  controller: _emailController,
                  cursorColor: Colors.blueGrey,
                  decoration: InputDecoration(
                    labelText: 'Email Address',
                    labelStyle: const TextStyle(
                      color: Colors.blueGrey,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        color: Colors.blueGrey,
                        width: 0.5,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        color: Colors.blueGrey,
                        width: 0.5,
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),

                ///Spacer
                const SizedBox(
                  height: 20,
                ),

                ///Password
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please fill with your Password.';
                    }
                    return null;
                  },
                  controller: _passwordController,
                  cursorColor: Colors.blueGrey,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: const TextStyle(
                      color: Colors.blueGrey,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        color: Colors.blueGrey,
                        width: 0.5,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        color: Colors.blueGrey,
                        width: 0.5,
                      ),
                    ),
                  ),
                  obscureText: true,
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final isValid = _formKey.currentState?.validate();
          if (isValid != true) {
            return;
          }

          showDialog(
            context: context,
            builder: ((context) {
              return AlertDialog(
                title: const Text('Info'),
                content: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Name: ${_nameController.text}'),
                      Text('Username: ${_usernameController.text}'),
                      Text('Email: ${_emailController.text}'),
                      Text('Password: ${_passwordController.text}'),
                    ],
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      _nameController.clear();
                      _usernameController.clear();
                      _emailController.clear();
                      _passwordController.clear();
                    },
                    child: const Text('Ok'),
                  ),
                ],
              );
            }),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
