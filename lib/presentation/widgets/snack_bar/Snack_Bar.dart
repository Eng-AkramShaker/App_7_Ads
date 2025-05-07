// ignore_for_file: file_names

import 'package:flutter/material.dart';

Snack_Bar(BuildContext context, Color color, String text) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      showCloseIcon: true,
      closeIconColor: Colors.white,
      backgroundColor: color,
      duration: const Duration(milliseconds: 1500),
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.only(
        bottom: MediaQuery.sizeOf(context).height - 140,
        left: 10,
        right: 10,
      ),
      content: Center(child: Text(text))));
}
