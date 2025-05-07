// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:app_7/core/constants/ColorManager.dart';

Widget custom_Container(
    {required double h, required double w, double? r, double? l, double? t, double? b, double? size_icon, var icon, color_icon}) {
  return Padding(
      padding: EdgeInsets.only(right: r ?? 8, left: l ?? 0, top: t ?? 0, bottom: b ?? 0),
      child: Container(
        width: h,
        height: w,
        decoration: BoxDecoration(shape: BoxShape.circle, color: ColorManager.primary, boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            spreadRadius: 5, //spread radius
            blurRadius: 8, // blur radius
            offset: const Offset(0, 0),
          ),
        ]),
        child: Icon(
          icon ?? Icons.arrow_back_ios_sharp,
          color: color_icon ?? ColorManager.b_A0,
          size: size_icon ?? 20,
        ),
      ));
}
