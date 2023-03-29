// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:brew_crew/services/auth.dart';
import 'package:flutter/material.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthService _auth = AuthService();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home - Brew Crew'),
        centerTitle: true,
        elevation: 0.0,
        actions: [
          IconButton(
            onPressed: () async {
              await _auth.signOut();
            },
            icon: const Icon(Icons.logout_rounded),
          )
        ],
      ),
    );
  }
}
