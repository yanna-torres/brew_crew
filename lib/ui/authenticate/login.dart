// ignore_for_file: use_build_context_synchronously

import 'package:brew_crew/services/auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.toggleView});
  final toggleView;
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthService _authService = AuthService();
  bool visible = false;
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   elevation: 0.0,
      //   title: const Text('Login'),
      //   centerTitle: true,
      // ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(25),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Image.asset(
                  'assests/coffee.png',
                  width: 115,
                ),
                const SizedBox(height: 50),
                const Text(
                  'Login to Brew Crew',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 50),
                TextFormField(
                  controller: controllerEmail,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  onChanged: (value) {},
                  decoration: myDecoration(
                    label: 'E-mail',
                    icon: const Icon(Icons.alternate_email_rounded),
                  ),
                  validator: (value) {
                    if (value == null) {
                      return 'Fill this field with an e-mail';
                    } else if (value.contains('@') == false ||
                        value.contains('.') == false) {
                      return 'Fill with an valid e-mail';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(height: 25),
                TextFormField(
                  controller: controllerPassword,
                  obscureText: !visible ? true : false,
                  onChanged: (value) {},
                  decoration: myDecoration(
                    label: 'Password',
                    icon: InkWell(
                      onTap: () {
                        setState(() {
                          visible = !visible;
                        });
                      },
                      child: visible
                          ? const Icon(Icons.visibility_outlined)
                          : const Icon(Icons.visibility_off_outlined),
                    ),
                  ),
                  validator: (value) {
                    if (value == null) {
                      return 'Fill with your password';
                    } else if (value.length < 6) {
                      return 'Your password must have at least 6 characters';
                    } else {
                      return null;
                    }
                  },
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
                    print(controllerEmail.text);
                    print(controllerPassword.text);
                    if (formKey.currentState!.validate()) {}
                  },
                  child: const Text(
                    'Login',
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
                      "Don't have an account?",
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
                    'Register',
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

InputDecoration myDecoration({required String label, required Widget icon}) {
  return InputDecoration(
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.transparent,
      ),
      borderRadius: BorderRadius.circular(15),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.red,
      ),
      borderRadius: BorderRadius.circular(15),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.brown.shade300,
      ),
      borderRadius: BorderRadius.circular(15),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.red,
      ),
      borderRadius: BorderRadius.circular(15),
    ),
    filled: true,
    fillColor: Colors.brown.shade400.withOpacity(0.3),
    label: Text(
      label,
      style: const TextStyle(
        fontWeight: FontWeight.w600,
        // color: Color(0xFF949494),
      ),
    ),
    floatingLabelBehavior: FloatingLabelBehavior.never,
    prefixIcon: icon,
  );
}
