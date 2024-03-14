import 'package:flutter/cupertino.dart';
import 'package:todotask/presentation/widgets/custom_tex2.dart';
import 'package:todotask/utils/constants/ColorManager.dart';

class WaletContainer extends StatelessWidget {
  const WaletContainer({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.26,
      width: size.width * 0.35,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: ColorManager.b_69,
      ),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 5,
          ),
          CustomText(
            text: 'المحفظه والرصيد :',
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
    );
  }
}
