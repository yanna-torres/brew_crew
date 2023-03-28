// ignore_for_file: use_build_context_synchronously

import 'package:brew_crew/services/auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () async {
                  dynamic result = await _authService.signInAnon();
                  if (result.runtimeType == String) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        elevation: 0,
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: const Color(0xFFFCBDBD),
                        dismissDirection: DismissDirection.startToEnd,
                        content: Row(
                          children: [
                            const Icon(
                              Icons.error_outline,
                              color: Color(0xFF7D2E2E),
                            ),
                            const SizedBox(width: 5),
                            Text(
                              result,
                              style: const TextStyle(
                                color: Color(0xFF7D2E2E),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  } else {
                    print('sign in');
                    print(result.uid);
                  }
                },
                child: const Text('login anon'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
