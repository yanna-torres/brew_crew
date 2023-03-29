import 'package:brew_crew/models/user.dart';
import 'package:brew_crew/services/auth.dart';
import 'package:brew_crew/ui/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserApp?>.value(
      initialData: null,
      catchError: (context, error) {},
      value: AuthService().user,
      child: MaterialApp(
        title: 'Brew Crew App',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.brown.shade100,
          primarySwatch: Colors.brown,
        ),
        home: const Wrapper(),
      ),
    );
  }
}
