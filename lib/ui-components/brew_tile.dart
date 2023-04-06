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
        color: const Color(0xFFF3F0EE),
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: Color(0x40000000),
            blurRadius: 5.0,
            offset: Offset(0, 0),
          ),
        ],
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
