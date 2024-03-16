import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todotask/presentation/screens/adsense/widgets/custom_text_field.dart';
import 'package:todotask/utils/constants/ColorManager.dart';

// ignore: must_be_immutable
class AdressContainer extends StatelessWidget {
  AdressContainer({super.key});
  var addressController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 13, right: 13),
      child: CustomTextField(
        height: 50,
        centerText: true,
        lableStyle: const TextStyle(
          fontSize: 15,
          color: ColorManager.grayColor,
        ),
        lable: ' العنوان  ',
        controller: addressController,
        borderColor: ColorManager.primary,
        hasBorder: true,
        radius: 10,
        style: const TextStyle(color: Colors.black, fontSize: 20),
        textInputType: TextInputType.text,
        icon: const Padding(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: CircleAvatar(
            radius: 15,
            backgroundColor: ColorManager.primary,
            child: Icon(
              Icons.place,
              color: ColorManager.w_color,
            ),
          ),
        ),
      ),
    );
  }
}
