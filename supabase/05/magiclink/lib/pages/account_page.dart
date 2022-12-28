import 'package:flutter/material.dart';
import 'package:magiclink/components/avatar.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:magiclink/utils/utils.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final _usernameController = TextEditingController();
  final _websiteController = TextEditingController();
  String? _avatarUrl;
  dynamic _loading = false;

  ///called once a user id is received within `onAuthenticated()`
  Future<void> _getProfile() async {
    setState(() {
      _loading = true;
    });

    try {
      final userId = supabase.auth.currentUser!.id;
      final data = await supabase
          .from('profiles')
          .select()
          .eq('id', userId)
          .single() as Map;

      _usernameController.text = (data['username'] ?? '') as String;
      _websiteController.text = (data['website'] ?? '') as String;
      _avatarUrl = (data['avatar_url'] ?? '') as String;
    } on PostgrestException catch (error) {
      context.showErrorSnackBar(message: error.message);
    } catch (error) {
      context.showErrorSnackBar(message: 'Unexpected exception occured');
    }

    setState(() {
      _loading = false;
    });
  }

  ///called when user taps `update` button
  Future<void> _updateProfile() async {
    setState(() {
      _loading = true;
    });

    final userName = _usernameController.text;
    final website = _websiteController.text;
    final user = supabase.auth.currentUser;
    final updates = {
      'id': user!.id,
      'username': userName,
      'website': website,
      'updated_at': DateTime.now().toIso8601String(),
    };

    try {
      await supabase.from('profiles').upsert(updates);
      if (mounted) {
        context.showSnackBar(message: 'Successfully updated profile');
      }
    } on PostgrestException catch (error) {
      context.showErrorSnackBar(message: error.message);
    } catch (error) {
      context.showErrorSnackBar(message: 'Unexpected error occurred');
    }

    setState(() {
      _loading = false;
    });
  }

  Future<void> _onUpload(String imageUrl) async {
    try {
      final userId = supabase.auth.currentUser!.id;
      await supabase.from('profiles').upsert({
        'id': userId,
        'avatar_url': imageUrl,
      });
      if (mounted) {
        context.showSnackBar(message: 'Updated your profile image!');
      }
    } on PostgrestException catch (error) {
      context.showErrorSnackBar(message: error.message);
    } catch (error) {
      context.showErrorSnackBar(message: 'Unexpected error has occurred');
    }

    if (!mounted) {
      return;
    }
    setState(() {
      _avatarUrl = imageUrl;
    });
  }

  Future<void> _signOut() async {
    try {
      await supabase.auth.signOut();
    } on AuthException catch (error) {
      context.showErrorSnackBar(message: error.message);
    } catch (error) {
      context.showErrorSnackBar(message: 'Unexpected error occurred');
    }

    if (mounted) {
      Navigator.of(context).pushReplacementNamed('/');
    }
  }

  ///override initState()
  @override
  void initState() {
    super.initState();
    _getProfile();
  }

  ///override dispose()
  @override
  void dispose() {
    _usernameController.dispose();
    _websiteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Avatar(
                  imageURL: _avatarUrl,
                  onUpload: _onUpload,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _usernameController,
                cursorColor: Colors.brown,
                decoration: InputDecoration(
                  labelText: 'User Name',
                  labelStyle: const TextStyle(
                    color: Colors.brown,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                      color: Colors.brown,
                      width: 0.5,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                      color: Colors.brown,
                      width: 0.5,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _websiteController,
                cursorColor: Colors.brown,
                decoration: InputDecoration(
                  labelText: 'Website',
                  labelStyle: const TextStyle(
                    color: Colors.brown,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                      color: Colors.brown,
                      width: 0.5,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                      color: Colors.brown,
                      width: 0.5,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.brown,
                ),
                onPressed: _updateProfile,
                child: Text(_loading ? 'Saving...' : 'Update'),
              ),
              const SizedBox(
                height: 20,
              ),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(
                    color: Colors.brown,
                  ),
                ),
                onPressed: _signOut,
                child: const Text(
                  'Sign Out',
                  style: TextStyle(
                    color: Colors.brown,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
