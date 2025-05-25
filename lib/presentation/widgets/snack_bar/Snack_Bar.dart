// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/material.dart';

void Snack_Bar(BuildContext context, String text, {Color? color}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: color ?? Colors.red,
      duration: const Duration(milliseconds: 2000),
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      showCloseIcon: true,
      closeIconColor: Colors.white,
      content: Text(
        text,
        textAlign: TextAlign.right, // أو left حسب اللغة
        style: const TextStyle(color: Colors.white),
      ),
    ),
  );
}
