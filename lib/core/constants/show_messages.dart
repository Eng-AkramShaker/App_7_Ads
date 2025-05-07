// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_custom_dialog/flutter_custom_dialog.dart';

YYDialog Show_Message_YYAlertDialog(BuildContext context, text, onTap_yes) {
  return YYDialog().build(context)
    ..width = 220
    ..borderRadius = 4.0
    ..text(
      padding: const EdgeInsets.all(25.0),
      alignment: Alignment.center,
      text: text,
      color: Colors.black,
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
    )
    ..divider()
    ..doubleButton(
      padding: const EdgeInsets.only(top: 10.0),
      gravity: Gravity.center,
      withDivider: true,
      text1: "رجوع",
      color1: Colors.redAccent,
      fontSize1: 14.0,
      fontWeight1: FontWeight.bold,
      onTap1: () {},
      text2: "تأكيد",
      color2: Colors.green,
      fontSize2: 14.0,
      fontWeight2: FontWeight.bold,
      onTap2: onTap_yes,
    )
    ..show();
}
