import 'package:flutter/material.dart';
import 'package:simpleapp1/utils/common.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: Text(
              'Welcome',
              style: TextStyle(
                fontSize: 22,
              ),
            ),
          ),
          OutlinedButton(
            onPressed: () async {
              await client.auth.signOut();
            },
            child: const Text('Sign Out'),
          ),
        ],
      ),
    );
  }
}
