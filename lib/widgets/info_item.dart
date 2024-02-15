import 'package:app7ads/widgets/custom_tex2.dart';
import 'package:flutter/material.dart';

import '../constes/colormanager.dart';

class infoItem extends StatelessWidget {
  infoItem({
    required this.infoKey  ,
    required this.infoValue  ,
    super.key,
  });
  String? infoKey ;
  String ?infoValue ;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomText(
          text: infoKey!,
          color: ColorManager.w_color,
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
        SizedBox(
          width: 5.0,
        ),
        CustomText(
          text: infoValue!,
          color: ColorManager.w_color,
          fontWeight: FontWeight.bold,

        ),
      ],
    );
  }
}
