import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todotask/presentation/screens/adsense/widgets/custom_text_field.dart';
import 'package:todotask/utils/constants/ColorManager.dart';

// ignore: must_be_immutable
class CustomContainer extends StatelessWidget {
  CustomContainer({super.key, required this.text, required this.icon});
  var addressController = TextEditingController();
  final String text;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 13, right: 13),
      child: Container(
        width: .9 * MediaQuery.sizeOf(context).width,
        height: 50,
        decoration: const BoxDecoration(color: Colors.white),
        child: CustomTextField(
          height: 50,
          centerText: true,
          lableStyle: const TextStyle(
            fontSize: 15,
            color: ColorManager.grayColor,
          ),
          lable: text,
          controller: addressController,
          borderColor: ColorManager.primary,
          hasBorder: true,
          radius: 10,
          style: const TextStyle(color: Colors.black, fontSize: 20),
          textInputType: TextInputType.text,
          icon: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: CircleAvatar(
              radius: 15,
              backgroundColor: ColorManager.primary,
              child: Icon(
                icon,
                color: ColorManager.w_color,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
