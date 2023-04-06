import 'package:brew_crew/ui-components/text_field.dart';
import 'package:flutter/material.dart';

class PreferencesForm extends StatefulWidget {
  const PreferencesForm({super.key});

  @override
  State<PreferencesForm> createState() => _PreferencesFormState();
}

class _PreferencesFormState extends State<PreferencesForm> {
  final _formKey = GlobalKey();
  final List<String> sugars = ['0', '1', '2', '3', '4'];
  TextEditingController nameController = TextEditingController();

  String? _currentName;
  String? _currentSugars;
  int? _currentStrength;
  @override
  Widget build(BuildContext context) {
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
            value: _currentSugars ?? '0',
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
            activeColor: Colors.brown[_currentStrength ?? 100],
            value: (_currentStrength ?? 100).toDouble(),
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
              print(_currentName);
              print(_currentStrength);
              print(_currentSugars);
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
  }
}
