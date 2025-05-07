// ignore_for_file: must_be_immutable, camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_custom_carousel_slider/flutter_custom_carousel_slider.dart';

Widget Auto_Slider(BuildContext context, {double? h, List? imageList}) {
  return CustomCarouselSlider(
    height: h ?? 150,
    width: double.maxFinite,
    subHeight: 0,
    selectedDotColor: Colors.green,
    unselectedDotColor: Colors.white,
    items: imageList!.map((url) {
      return CarouselItem(
        image: NetworkImage(url),
        titleTextStyle: const TextStyle(
          fontSize: 12,
          color: Colors.white,
        ),
        onImageTap: (i) {},
      );
    }).toList(),
  );
}
