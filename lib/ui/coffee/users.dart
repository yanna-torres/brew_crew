// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:brew_crew/models/brew.dart';
import 'package:brew_crew/services/auth.dart';
import 'package:brew_crew/ui/coffee/brew_list.dart';
import 'package:flutter/material.dart';
import 'package:brew_crew/services/database.dart';
import 'package:provider/provider.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthService _auth = AuthService();
    return StreamProvider<List<Brew>>.value(
      initialData: [],
      value: DatabaseService().brews,
      child: Scaffold(
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
        body: BrewList(),
      ),
    );
  }
}
