// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
// ignore_for_file: sized_box_for_whitespace

import 'package:app_7/presentation/widgets/images/display_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:app_7/core/constants/ColorManager.dart';

Widget ItemCard(context,
    {Function()? onPressed, imageUrls, date, num_views, city, select_Items, price, location, description, action_color}) {
  Size size = MediaQuery.of(context).size;

  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Card(
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: Colors.white,
      child: Container(
        height: 120,
        decoration: BoxDecoration(
          border: Border.all(color: ColorManager.primary),
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      width: 60,
                      child: custom_img(imageUrls),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "$price  ج.م",
                          style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: ColorManager.primary),
                        ),
                        const Text(
                          " | ",
                          style: TextStyle(fontSize: 40, color: ColorManager.grayColor),
                        ),
                        Text(
                          "$city ",
                          style: TextStyle(color: ColorManager.primary, fontSize: 13, fontWeight: FontWeight.bold),
                        ),
                        const Text(
                          " | ",
                          style: TextStyle(fontSize: 40, color: ColorManager.grayColor),
                        ),
                        Text(
                          '$select_Items ',
                          style: const TextStyle(color: ColorManager.primary, fontSize: 13, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Container(width: size.width / 1.7, color: ColorManager.grayColor, height: 3.5),
                    Row(
                      children: [
                        Text(
                          date,
                          style: TextStyle(color: ColorManager.primary, fontSize: 13, fontWeight: FontWeight.bold),
                        ),
                        const Text(
                          " | ",
                          style: TextStyle(fontSize: 40, color: ColorManager.grayColor),
                        ),
                        Text(
                          description.split(' ').take(3).join(' ') + ' ...',
                          style: TextStyle(color: ColorManager.primary, fontSize: 13, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
                Expanded(
                  child: SizedBox(width: 10),
                )
              ],
            ),

            //

            Positioned(
              top: 5,
              right: 5,
              child: IconButton(
                color: action_color,
                iconSize: 25,
                icon: Icon(Icons.favorite_border),
                onPressed: onPressed,
              ),
            ),

            Positioned(
                bottom: 5,
                right: 5,
                child: Stack(
                  children: [
                    IconButton(
                      color: Colors.grey,
                      iconSize: 25,
                      icon: Icon(Icons.visibility),
                      onPressed: () {},
                    ),
                    Positioned(
                      left: 0,
                      bottom: 0,
                      child: Text(
                        '$num_views',
                        style: TextStyle(
                          color: ColorManager.primary,
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                )),

            //
          ],
        ),
      ),
    ),
  );
}
