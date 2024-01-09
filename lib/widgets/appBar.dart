// ignore_for_file: non_constant_identifier_names, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:app_7_ads/constes/ColorManager.dart';
import 'package:app_7_ads/widgets/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

AppBar custom_AppBar({required context, required String title}) {
  return AppBar(
    backgroundColor: ColorManager.w_FA,
    centerTitle: true,
    leadingWidth: 20,
    automaticallyImplyLeading: false,
    actions: [
      GestureDetector(
        onTap: () {
          //
          Get.back();
        },
        child: custom_Container(h: 35.0, w: 35.0),
      ),
    ],
    leading: IconButton(
      padding: const EdgeInsets.only(left: 8),
      onPressed: () {
        //
      },
      icon: const Icon(
        Icons.logout_rounded,
        color: Colors.red,
        size: 30,
      ),
    ),
    title: Text(
      title ?? '',
      style: const TextStyle(
        color: ColorManager.b_69,
        fontSize: 23,
        fontWeight: FontWeight.w700,
        fontFamily: 'Tajawal',
      ),
    ),
  );
}
