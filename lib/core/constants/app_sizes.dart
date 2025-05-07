// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
//

// =========================================================

double height_media(BuildContext context) {
  double resheight = MediaQuery.sizeOf(context).height;
  return resheight;
}

double width_media(BuildContext context) {
  double reswidth = MediaQuery.sizeOf(context).width;
  return reswidth;
}
