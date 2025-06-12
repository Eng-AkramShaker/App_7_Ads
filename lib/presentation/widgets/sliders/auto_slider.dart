// ignore_for_file: must_be_immutable, camel_case_types, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_custom_carousel_slider/flutter_custom_carousel_slider.dart';

Widget Auto_Slider(BuildContext context, {double? h, List? imageList}) {
  return imageList!.isEmpty
      ? SizedBox(
          width: double.infinity,
          height: 300,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset("assets/images/empty.jpg", fit: BoxFit.fill),
          ),
        )
      : CustomCarouselSlider(
          height: h ?? 150,
          width: double.maxFinite,
          subHeight: 0,
          selectedDotColor: Colors.green,
          unselectedDotColor: Colors.white,
          items: imageList.map((url) {
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
