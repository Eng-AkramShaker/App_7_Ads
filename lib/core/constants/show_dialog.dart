// ignore_for_file: non_constant_identifier_names

import 'package:app_7/core/constants/navigators.dart';
import 'package:flutter/material.dart';

Snack_Select_Menu({required context, backColor, String? button_tex, required Widget widget, required onPressed}) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: backColor ?? Colors.white,
        content: widget,
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: .10),
                ),
                onPressed: () {
                  pop(context);
                },
                child: Text('إلغاء', style: TextStyle(color: Colors.white, fontSize: 10)),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                ),
                onPressed: onPressed,
                child: Text(button_tex ?? 'تأكيد', style: TextStyle(color: Colors.white, fontSize: 10)),
              ),
            ],
          ),
        ],
      );
    },
  );
}
