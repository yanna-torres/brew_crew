import 'package:brew_crew/models/user.dart';
import 'package:brew_crew/ui/authenticate/authenticate.dart';
import 'package:brew_crew/ui/coffee/users.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserApp?>(context);

    // TODO: return either users ou authenticate
    if (user == null) {
      return const Authenticate();
    } else {
      return UsersPage();
    }
  }
}
