import 'package:flutter/material.dart';

navigateAndFinish({
  required BuildContext context,
  required Widget widget,
}) =>
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
          (route) => false,
    );

navigateTo({
  required BuildContext context,
  required Widget widget,
}) =>
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );


Widget myButton({
  required String text,
  required Function onTap,
  double? width = 90.0,
  double? height = 60.0,
  BuildContext? context ,
  Color? color ,
  Color? textcolor =Colors.white ,
  double textSize =18.0,
}) =>
    GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        decoration: BoxDecoration(
          color: color ,
          borderRadius: BorderRadius.circular(20.0),
        ),
        width: width,
        height: height,
        child: Center(
          child: Text(
            text,
            style:  TextStyle(
              color: textcolor,
              fontWeight: FontWeight.bold,
              fontSize: textSize,
            ),
          ),
        ),
      ),
    );