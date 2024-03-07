// ignore_for_file: non_constant_identifier_names, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

AppBar custom_AppBar({required context, required String title}) {
  return AppBar(
    title: const Text("Standard AppBar"),
    backgroundColor: Colors.transparent,
    // elevation: 0.4,
    actions: [
      IconButton(
        icon: Icon(Icons.settings),
        onPressed: () {
          // Pressed Action
        },
      ),
      IconButton(
        icon: Icon(Icons.menu),
        onPressed: () {
          // Pressed Action
        },
      ),
    ],
  );
}
