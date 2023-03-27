import 'package:brew_crew/ui/wrapper.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Brew Crew App',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: const Wrapper(),
    );
  }
}
