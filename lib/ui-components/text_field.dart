import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  const MyTextField({
    super.key,
    required this.controller,
    required this.label,
    required this.icon,
    required this.validator,
    this.isPassword = false,
    this.onChanged,
    this.initialValue,
  });
  final TextEditingController controller;
  final String label;
  final IconData icon;
  final String? Function(String? value)? validator;
  final String? Function(String? value)? onChanged;
  final bool isPassword;
  final String? initialValue;

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  bool visible = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: widget.initialValue,
      obscureText: widget.isPassword ? (!visible ? true : false) : false,
      decoration: textFieldDecoration.copyWith(
        label: Text(
          widget.label,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            // color: Color(0xFF949494),
          ),
        ),
        prefixIcon: widget.isPassword
            ? IconButton(
                onPressed: () {
                  setState(() {
                    visible = !visible;
                  });
                },
                icon: visible
                    ? Icon(
                        Icons.visibility_outlined,
                        color: Colors.brown.shade800,
                      )
                    : Icon(
                        Icons.visibility_off_outlined,
                        color: Colors.brown.shade800,
                      ),
              )
            : Icon(widget.icon, color: Colors.brown.shade800),
      ),
      onChanged: widget.onChanged,
      validator: widget.validator,
    );
  }
}

InputDecoration textFieldDecoration = InputDecoration(
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
  floatingLabelBehavior: FloatingLabelBehavior.never,
);
