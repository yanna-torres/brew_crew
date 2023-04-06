// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:brew_crew/models/brew.dart';
import 'package:brew_crew/services/auth.dart';
import 'package:brew_crew/ui/coffee/brew_list.dart';
import 'package:brew_crew/ui/coffee/preferences.dart';
import 'package:flutter/material.dart';
import 'package:brew_crew/services/database.dart';
import 'package:provider/provider.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthService _auth = AuthService();

    void _showSettingsPanel() {
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 50.0,
              vertical: 10.0,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: Colors.brown.shade300,
                      size: 30,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const PreferencesForm(),
                ],
              ),
            ),
          );
        },
      );
    }

    return StreamProvider<List<Brew>>.value(
      initialData: const [],
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
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton.icon(
                style: TextButton.styleFrom(),
                onPressed: () => _showSettingsPanel(),
                icon: const Icon(Icons.settings_rounded, size: 25),
                label: const Text(
                  "Settings",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              const BrewList(),
            ],
          ),
        ),
      ),
    );
  }
}
