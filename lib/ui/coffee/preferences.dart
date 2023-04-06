import 'package:brew_crew/models/user.dart';
import 'package:brew_crew/services/database.dart';
import 'package:brew_crew/ui-components/loading.dart';
import 'package:brew_crew/ui-components/text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PreferencesForm extends StatefulWidget {
  const PreferencesForm({super.key});

  @override
  State<PreferencesForm> createState() => _PreferencesFormState();
}

class _PreferencesFormState extends State<PreferencesForm> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final List<String> sugars = ['0', '1', '2', '3', '4'];
  TextEditingController nameController = TextEditingController();

  String? _currentName;
  String? _currentSugars;
  int? _currentStrength;
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserApp?>(context);
    return StreamBuilder<UserData>(
      stream: DatabaseService(uid: user!.uid).userData,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          UserData? userData = snapshot.data!;
          return Form(
            key: _formKey,
            child: Column(
              children: [
                const Text(
                  'Update your brew preferences',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.brown,
                  ),
                ),
                const SizedBox(height: 30.0),
                MyTextField(
                  initialValue: userData.name,
                  controller: nameController,
                  label: 'Name',
                  icon: Icons.person_rounded,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter a name";
                    } else {
                      return null;
                    }
                  },
                  onChanged: (value) {
                    setState(() {
                      _currentName = value;
                    });
                  },
                ),
                const SizedBox(height: 20.0),
                // dropdown
                DropdownButtonFormField(
                  value: _currentSugars ?? userData.sugars,
                  decoration: textFieldDecoration.copyWith(
                    label: const Text(
                      'Sugars',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        // color: Color(0xFF949494),
                      ),
                    ),
                    prefixIcon: Icon(
                      Icons.coffee_maker_rounded,
                      color: Colors.brown.shade800,
                    ),
                  ),
                  items: sugars.map((sugar) {
                    return DropdownMenuItem(
                      value: sugar,
                      child: Text('$sugar sugar(s)'),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _currentSugars = value;
                    });
                  },
                ),
                // slider
                const SizedBox(height: 20.0),
                Slider(
                  min: 100,
                  max: 900,
                  divisions: 8,
                  activeColor:
                      Colors.brown[_currentStrength ?? userData.strengh],
                  value: (_currentStrength ?? userData.strengh).toDouble(),
                  onChanged: (value) {
                    setState(() {
                      _currentStrength = value.round();
                    });
                  },
                ),
                const SizedBox(height: 35.0),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0.0,
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 20,
                    ),
                  ),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      await DatabaseService(uid: user.uid).updateUserData(
                        sugars: _currentSugars ?? userData.sugars,
                        name: _currentName ?? userData.name,
                        strengh: _currentStrength ?? userData.strengh,
                      );
                      Navigator.pop(context);
                    }
                  },
                  child: const Text(
                    'Update',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
              ],
            ),
          );
        } else {
          return Loading();
        }
      },
    );
  }
}
