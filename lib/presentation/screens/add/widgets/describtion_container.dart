import 'package:app_7/presentation/screens/add/widgets/custom_text_field.dart';
import 'package:app_7/core/constants/ColorManager.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DescribtionContainer extends StatelessWidget {
  DescribtionContainer({super.key});
  var descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 13, right: 13),
      child: CustomTextField(
        centerText: true,
        lableStyle: const TextStyle(
          fontSize: 15,
          color: ColorManager.grayColor,
        ),
        lable: 'وصف الاعلان ',
        controller: descriptionController,
        borderColor: ColorManager.primary,
        hasBorder: true,
        radius: 10,
        style: const TextStyle(color: Colors.black, fontSize: 15),
        textInputType: TextInputType.text,
        icon: const Padding(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: CircleAvatar(
            radius: 15,
            backgroundColor: ColorManager.primary,
            child: Icon(
              Icons.text_fields,
              color: ColorManager.w_color,
            ),
          ),
        ),
      ),
    );
  }
}
