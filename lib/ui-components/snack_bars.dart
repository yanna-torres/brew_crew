import 'package:flutter/material.dart';

SnackBar errorMessage({required String error}) {
  return SnackBar(
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
          error,
          style: const TextStyle(
            color: Color(0xFF7D2E2E),
            fontSize: 16,
          ),
        ),
      ],
    ),
  );
}
