import 'package:flutter/material.dart';
import 'package:app_7/core/constants/ColorManager.dart';

import '../../../../widgets/custom_tex2.dart';

class infoItem extends StatelessWidget {
  infoItem({
    required this.infoKey,
    required this.infoValue,
    super.key,
  });
  String? infoKey;
  String? infoValue;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomText(
          text: infoKey!,
          color: ColorManager.primary,
          fontSize: 13,
          fontWeight: FontWeight.bold,
        ),
        const SizedBox(
          width: 5.0,
        ),
        CustomText(
          text: infoValue!,
          color: ColorManager.primary,
          fontWeight: FontWeight.bold,
          fontSize: 13,
        ),
      ],
    );
  }
}
