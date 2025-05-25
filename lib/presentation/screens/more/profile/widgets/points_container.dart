// ignore_for_file: must_be_immutable, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:app_7/core/constants/ColorManager.dart';

import '../../../../../core/components/components.dart';
import '../../../../widgets/custom_tex2.dart';

class PointsContainer extends StatefulWidget {
  const PointsContainer({super.key});

  @override
  State<PointsContainer> createState() => _PointsContainerState();
}

class _PointsContainerState extends State<PointsContainer> {
  bool color_Action = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          height: size.height * 0.26,
          width: size.width * 0.35,
          decoration: BoxDecoration(
            border: Border.all(color: ColorManager.primary),
            borderRadius: BorderRadius.circular(30),
            color: Colors.white,
          ),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 5,
              ),
              CustomText(
                text: ' : النقاط',
                color: ColorManager.primary,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              CustomText(
                text: '15',
                color: ColorManager.primary,
                fontWeight: FontWeight.bold,
                fontSize: 38,
              ),
              CustomText(
                text: 'نقطه فقط',
                color: ColorManager.primary,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              SizedBox(height: 5),
            ],
          ),
        ),

        //  ================================================

        const SizedBox(height: 15),
        customButton(
          text: 'تبديل لنقاط',
          color: color_Action ? ColorManager.redColor : ColorManager.primary,
          onTap: () {
            setState(() {
              color_Action = !color_Action;
            });
          },
        ),
      ],
    );
  }
}
