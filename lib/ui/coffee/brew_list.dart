import 'package:brew_crew/models/brew.dart';
import 'package:brew_crew/ui-components/brew_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BrewList extends StatefulWidget {
  const BrewList({super.key});

  @override
  State<BrewList> createState() => _BrewListState();
}

class _BrewListState extends State<BrewList> {
  @override
  Widget build(BuildContext context) {
    final brews = Provider.of<List<Brew>>(context);
    if (brews.isEmpty) {
      return Container(
        padding: const EdgeInsets.all(25),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.brown.shade300,
        ),
        child: const Center(
          child: Text("No info was found!"),
        ),
      );
    } else {
      return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return BrewTile(
            brew: brews[index],
          );
        },
        itemCount: brews.length,
        shrinkWrap: true,
      );
    }
  }
}
