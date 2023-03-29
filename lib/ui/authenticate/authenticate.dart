import 'package:brew_crew/ui/authenticate/login.dart';
import 'package:brew_crew/ui/authenticate/register.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({super.key});

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showLogin = true;

  toggleView() {
    setState(() {
      showLogin = !showLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLogin) {
      return LoginPage(
        toggleView: toggleView,
      );
    } else {
      return RegisterPage(
        toggleView: toggleView,
      );
    }
  }
}
