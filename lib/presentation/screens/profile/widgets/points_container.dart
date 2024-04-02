import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todotask/presentation/widgets/custom_tex2.dart';
import 'package:todotask/utils/constants/ColorManager.dart';

class PointsContainer extends StatelessWidget {
  const PointsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
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
            text: 'النقاط :',
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
          SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}
