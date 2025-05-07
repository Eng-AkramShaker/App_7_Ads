// ignore_for_file: non_constant_identifier_names, unused_local_variable

import 'package:flutter/material.dart';
import 'package:app_7/core/constants/ColorManager.dart';

import '../../../../core/components/components.dart';
import '../../../widgets/custom_tex2.dart';

class WaletContainer extends StatefulWidget {
  const WaletContainer({super.key});

  @override
  State<WaletContainer> createState() => _WaletContainerState();
}

class _WaletContainerState extends State<WaletContainer> {
  bool color_Action = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    bool colorAction = false;

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
                text: ' : المحفظه والرصيد',
                color: ColorManager.primary,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              CustomText(
                text: '87',
                color: ColorManager.primary,
                fontWeight: FontWeight.bold,
                fontSize: 38,
              ),
              CustomText(
                text: 'جنيها فقط لا غير',
                color: ColorManager.primary,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              SizedBox(
                height: 5,
              ),
            ],
          ),
        ),

        //  ================================================

        const SizedBox(height: 15),
        customButton(
          text: 'أشحن',
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
