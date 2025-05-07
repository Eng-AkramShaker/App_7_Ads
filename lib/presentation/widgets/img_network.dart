// ignore_for_file: non_constant_identifier_names, unused_local_variable

import 'package:flutter/material.dart';

ClipRRect Custom_img_Network(String img, {double? h, double? w, double? circular}) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(circular ?? 10),
    child: const Column(
      children: [
        // CachedNetworkImage(
        //   imageUrl: img,
        //   placeholder: (context, url) => const CircularProgressIndicator(),
        //   errorWidget: (context, url, error) => const Icon(Icons.error),
        // ),
        // Image.network(
        //   img,
        //   // height: h ?? size.height,
        //   // width: w ?? size.width,
        //   fit: BoxFit.cover,
        // ),
      ],
    ),
  );
}
