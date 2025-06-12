// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

void Show_Message_YYAlertDialog(BuildContext context, text, onTapYes) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        content: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500),
        ),
        actionsAlignment: MainAxisAlignment.center,
        actions: <Widget>[
          TextButton(
            child: const Text('رجوع', style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold)),
            onPressed: () => Navigator.of(context).pop(),
          ),
          TextButton(
            child: const Text('تأكيد', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
            onPressed: () {
              Navigator.of(context).pop();
              onTapYes(); // تنفيذ دالة التأكيد
            },
          ),
        ],
      );
    },
  );
}
