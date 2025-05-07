import 'package:flutter/material.dart';
import 'package:app_7/core/constants/ColorManager.dart';

Widget Icon_Button(bool flag, icon, onPressed) {
  return Padding(
    padding: const EdgeInsets.all(5),
    child: Stack(
      children: [
        ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: flag ? ColorManager.primary : Colors.white,
            shape: const CircleBorder(),
          ).copyWith(
            overlayColor: const MaterialStatePropertyAll(ColorManager.primary),
            side: const MaterialStatePropertyAll(
              BorderSide(color: ColorManager.primary, width: 1.3),
            ),
          ),
          child: Icon(
            icon,
            color: ColorManager.w_color,
          ),
        ),
      ],
    ),
  );
}
