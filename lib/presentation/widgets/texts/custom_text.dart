import 'package:app_7/core/constants/ColorManager.dart';
import 'package:flutter/material.dart';

Text Custom_Text({required text, required double size, color, fontweight, bool underline = false}) {
  return Text(
    text ?? '',
    style: TextStyle(
      color: color ?? ColorManager.w_color,
      fontSize: size,
      fontWeight: fontweight ?? FontWeight.normal,
      fontFamily: 'Lemonada',
      decoration: underline == true ? TextDecoration.underline : TextDecoration.none,
    ),
  );
}
