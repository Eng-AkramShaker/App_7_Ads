// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

Widget Custom_Text({required text, double? size, color, fontweight}) {
  return Text(
    text ?? '',
    style: TextStyle(
      color: color ?? Colors.black,
      fontSize: size ?? 15.0,
      fontWeight: fontweight ?? FontWeight.w700,
      fontFamily: 'Tajawal',
    ),
  );
}
