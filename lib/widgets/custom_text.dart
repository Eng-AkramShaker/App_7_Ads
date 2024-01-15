// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

Custom_Text({required text, required double size, required color, fontweight}) {
  return Text(
    text ?? '',
    style: TextStyle(
      color: color,
      fontSize: size ?? 23.0,
      fontWeight: fontweight ?? FontWeight.w700,
      fontFamily: 'Tajawal',
    ),
  );
}
