// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:app_7/core/constants/ColorManager.dart';

Widget Button_Notifications(bool flag, int notificationCount, onPressed) {
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
          child: const Icon(
            Icons.notifications_active,
            color: ColorManager.w_color,
          ),
        ),
        if (notificationCount > 0)
          Positioned(
            right: 0,
            top: 0,
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
              constraints: const BoxConstraints(
                minWidth: 20,
                minHeight: 20,
              ),
              child: Text(
                '$notificationCount',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
      ],
    ),
  );
}
