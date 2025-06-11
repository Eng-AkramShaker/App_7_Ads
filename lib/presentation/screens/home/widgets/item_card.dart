// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:app_7/core/constants/ColorManager.dart';
import 'package:app_7/presentation/widgets/images/display_image_widget.dart';

Widget ItemCard(
  context, {
  Function()? onPressed,
  required String imageUrls,
  required String date,
  required int num_views,
  required String city,
  required String select_Items,
  required String price,
  required String description,
  required Color action_color,
}) {
  Size size = MediaQuery.of(context).size;

  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Card(
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: Colors.white,
      child: Container(
        height: 110,
        decoration: BoxDecoration(
          border: Border.all(color: ColorManager.primary),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 3, right: 45.0), // Leave space for favorite/eye icons
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // صورة
                    Container(
                      width: 70,
                      height: 70,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: custom_img(imageUrls),
                      ),
                    ),

                    // النصوص
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: SizedBox(
                          height: 80,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // السطر الأول: السعر - المدينة - النوع
                              Row(
                                children: [
                                  Text(
                                    "$price ج.م",
                                    style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: ColorManager.primary),
                                  ),
                                  const SizedBox(width: 8),
                                  const Text(" | ", style: TextStyle(fontSize: 16, color: ColorManager.grayColor)),
                                  const SizedBox(width: 8),
                                  Text(
                                    city,
                                    style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: ColorManager.primary),
                                  ),
                                  const SizedBox(width: 8),
                                  const Text(" | ", style: TextStyle(fontSize: 16, color: ColorManager.grayColor)),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Text(
                                      select_Items,
                                      style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: ColorManager.primary),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),

                              Container(width: double.infinity, height: 2, color: ColorManager.grayColor),

                              // السطر الثاني: التاريخ - وصف مختصر
                              Row(
                                children: [
                                  Text(
                                    date,
                                    style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: ColorManager.primary),
                                  ),
                                  const SizedBox(width: 8),
                                  const Text(" | ", style: TextStyle(fontSize: 16, color: ColorManager.grayColor)),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Text(
                                      '... ${description.split(' ').take(3).join(' ')} ',
                                      style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: ColorManager.primary),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // زر المفضلة
              Positioned(
                top: 0,
                right: 5,
                child: IconButton(
                  color: action_color,
                  iconSize: 25,
                  icon: const Icon(Icons.favorite_border),
                  onPressed: onPressed,
                ),
              ),

              // عدد المشاهدات
              Positioned(
                bottom: 0,
                right: 5,
                child: Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    IconButton(
                      color: Colors.grey,
                      iconSize: 25,
                      icon: const Icon(Icons.visibility),
                      onPressed: () {},
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8, bottom: 2),
                      child: Text(
                        '$num_views',
                        style: const TextStyle(
                          color: ColorManager.primary,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
