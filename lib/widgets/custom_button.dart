// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

import '../constes/ColorManager.dart';

Custom_Button(
    {required double h,
    required double w,
    double? r,
    double? l,
    double? t,
    double? b,
    String? text,
    double? size_icon}) {
  return Center(
    child: Padding(
      padding: EdgeInsets.only(
          right: r ?? 8, left: l ?? 0, top: t ?? 0, bottom: b ?? 0),
      child: Container(
        width: w,
        height: h,
        decoration: BoxDecoration(
          color: ColorManager.w_FA,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.4),
              spreadRadius: 5, //spread radius
              blurRadius: 8, // blur radius
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: Center(
          child: Text(
            text ?? '',
            style: const TextStyle(
              color: ColorManager.b_69,
              fontSize: 20.0,
              fontWeight: FontWeight.w500,
              fontFamily: 'Tajawal',
            ),
          ),
        ),
      ),
    ),
  );
}
