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

  // AppBar(
  //   backgroundColor: Colors.transparent,
  //   centerTitle: true,
  //   leadingWidth: 20,
  //   automaticallyImplyLeading: false,
  //   actions: [
  //     GestureDetector(
  //       onTap: () {
  //         //
  //         Get.back();
  //       },
  //       child: custom_Container(h: 40, w: 40.0),
  //     ),
  //   ],
  //   leading: IconButton(
  //     padding: const EdgeInsets.only(left: 8),
  //     onPressed: () {
  //       //
  //     },
  //     icon: const Icon(
  //       Icons.logout_rounded,
  //       color: Colors.red,
  //       size: 30,
  //     ),
  //   ),
  //   title: Text(
  //     title ?? '',
  //     style: const TextStyle(
  //       color: ColorManager.b_69,
  //       fontSize: 23,
  //       fontWeight: FontWeight.w700,
  //       fontFamily: 'Tajawal',
  //     ),
  //   ),
  // );
}
