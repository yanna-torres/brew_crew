// ignore_for_file: prefer_typing_uninitialized_variables, use_build_context_synchronously

import 'package:brew_crew/services/auth.dart';
import 'package:brew_crew/ui-components/snack_bars.dart';
import 'package:brew_crew/ui-components/text_field.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key, required this.toggleView});
  final toggleView;

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final AuthService _authService = AuthService();
  bool visible = false;
  final TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  final formRegisterKey = GlobalKey<FormState>();
  String? email = "";
  String? password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(25),
          child: Form(
            key: formRegisterKey,
            child: Column(
              children: [
                Image.asset(
                  'assests/coffee.png',
                  width: 115,
                ),
                const SizedBox(height: 50),
                const Text(
                  'Register to Brew Crew',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 50),
                MyTextField(
                  controller: controllerEmail,
                  onChanged: (value) {
                    setState(() {
                      email = value;
                    });
                  },
                  label: "E-mail",
                  icon: Icons.alternate_email_rounded,
                  validator: (value) {
                    if (value == null) {
                      return 'Enter an e-mail';
                    } else if (value.contains('@') == false ||
                        value.contains('.') == false) {
                      return 'Enter an valid e-mail';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(height: 25),
                MyTextField(
                  controller: controllerPassword,
                  onChanged: (value) {
                    setState(() {
                      password = value;
                    });
                  },
                  label: "Password",
                  icon: Icons.abc,
                  validator: (value) {
                    if (value!.length < 6) {
                      return 'Your password must have at least 6 characters';
                    } else {
                      return null;
                    }
                  },
                  isPassword: true,
                ),
                const SizedBox(height: 50),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 25,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () async {
                    if (formRegisterKey.currentState!.validate()) {
                      // TODO: mudar para pegar o texto direto dos controllers
                      dynamic result =
                          await _authService.registerEmailAndPassword(
                        email: email!,
                        password: password!,
                      );
                      if (result == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          errorMessage(
                            error: "Something went wrong! Email is valid?",
                          ),
                        );
                      }
                    }
                  },
                  child: const Text(
                    'Register',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                // const SizedBox(height: 50),
                const SizedBox(height: 30),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 2,
                        color: Colors.brown.withOpacity(.3),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Text(
                      'Already have an account?',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.brown.withOpacity(.5),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Container(
                        height: 2,
                        color: Colors.brown.withOpacity(.3),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                // go back to login
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 25,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: const BorderSide(color: Colors.brown, width: 2),
                    ),
                    backgroundColor: Colors.brown.shade100,
                    elevation: 0.0,
                    foregroundColor: Colors.brown,
                  ),
                  onPressed: () {
                    widget.toggleView();
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
