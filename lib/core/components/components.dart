import 'package:flutter/material.dart';

import '../constants/ColorManager.dart';

navigateAndFinish({
  required BuildContext context,
  required Widget widget,
}) =>
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => widget),
      (route) => false,
    );

navigateTo({required BuildContext context, required Widget widget}) => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => widget),
    );

// ==========================================================================

Widget customButton({
  required String text,
  required Function onTap,
  double? width = 110.0,
  double? height = 40.0,
  BuildContext? context,
  Color color = ColorManager.primary,
  Color? textcolor = Colors.white,
  double textSize = 18.0,
  double? circular,
}) =>
    GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(circular ?? 13.0),
        ),
        width: width,
        height: height,
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: textcolor,
              fontWeight: FontWeight.bold,
              fontSize: textSize,
            ),
          ),
        ),
      ),
    );
