import 'package:brew_crew/models/brew.dart';
import 'package:flutter/material.dart';

class BrewTile extends StatelessWidget {
  const BrewTile({super.key, required this.brew});
  final Brew brew;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white70,
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        iconColor: Colors.brown[brew.strength],
        leading: const Icon(
          Icons.coffee_rounded,
          size: 40,
        ),
        title: Text(brew.name),
        subtitle: Text('Sugars: ${brew.sugars}'),
      ),
    );
  }
}
