// ignore_for_file: non_constant_identifier_names

import 'package:app_7_ads/constes/ColorManager.dart';
import 'package:flutter/material.dart';

Padding custom_Container({required double h, required double w, double? r, double? l, double? t, double? b, double? size_icon}) {
  return Padding(
    padding: EdgeInsets.only(right: r ?? 8, left: l ?? 0, top: t ?? 0, bottom: b ?? 0),
    child: Container(
      height: h,
      width: w,
      decoration: BoxDecoration(
          color: ColorManager.w_FA,
          borderRadius: const BorderRadius.all(
            Radius.circular(50),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.4),
              spreadRadius: 5, //spread radius
              blurRadius: 8, // blur radius
              offset: const Offset(0, 0),
            ),
          ]),
      child: Center(
        child: Icon(
          Icons.arrow_back_ios_sharp,
          color: ColorManager.b_69,
          size: size_icon ?? 20,
        ),
      ),
    ),
  );
}
