import 'package:app_7/presentation/screens/add/widgets/custom_text_field.dart';
import 'package:app_7/core/constants/ColorManager.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class CustomContainer extends StatelessWidget {
  CustomContainer({super.key, this.h, this.w, required this.controller, this.maxLine, required this.text});

  final TextEditingController controller;
  final String text;
  final int? maxLine;
  final double? h;
  final double? w;

  @override
  Widget build(BuildContext context) {
    double containerWidth = (w != null && w! > 0) ? MediaQuery.of(context).size.width / w! : MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.only(left: 13, right: 13),
      child: Card(
        child: Container(
          width: containerWidth,
          decoration: const BoxDecoration(color: Colors.white),
          child: CustomTextField(
            height: h ?? 50,
            centerText: true,
            lableStyle: const TextStyle(fontSize: 15, color: ColorManager.grayColor),
            lable: text,
            controller: controller,
            borderColor: ColorManager.primary,
            hasBorder: true,
            radius: 10,
            style: const TextStyle(color: Colors.black, fontSize: 15),
            textInputType: TextInputType.text,
            maxLine: maxLine ?? 1,
          ),
        ),
      ),
    );
  }
}

class CustomContainer2 extends StatelessWidget {
  CustomContainer2({super.key, this.h, this.w, required this.controller, this.maxLine, required this.text});

  final TextEditingController controller;
  final String text;
  final int? maxLine;
  final double? h;
  final double? w;

  // دالة تنسيق الأرقام مع الفاصلة
  String formatNumber(int number) {
    final NumberFormat formatter = NumberFormat('#,###');
    return formatter.format(number);
  }

  @override
  Widget build(BuildContext context) {
    double containerWidth = (w != null && w! > 0) ? MediaQuery.of(context).size.width / w! : MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.only(left: 13, right: 13),
      child: Card(
        child: Container(
          width: containerWidth,
          decoration: const BoxDecoration(color: Colors.white),
          child: CustomTextField(
            height: h ?? 50,
            centerText: true,
            lableStyle: const TextStyle(fontSize: 15, color: ColorManager.grayColor),
            lable: text,
            controller: controller,
            borderColor: ColorManager.primary,
            hasBorder: true,
            radius: 10,
            style: const TextStyle(color: Colors.black, fontSize: 15),
            textInputType: TextInputType.number, // استخدام نوع الرقم
            maxLine: maxLine ?? 1,
            onChanged: (value) {
              // إزالة الفواصل قبل المعالجة
              String formattedValue = value.replaceAll(',', '');

              // التحقق من أنه يمكن تحويل القيمة إلى عدد صحيح
              int? number = int.tryParse(formattedValue);

              // إذا تم تحويل الرقم بنجاح، قم بتطبيق التنسيق
              if (number != null) {
                // استخدام TextEditingController لتحديث النص مع التنسيق
                String newFormattedValue = formatNumber(number);
                if (newFormattedValue != value) {
                  // إذا كان التنسيق مختلفًا، قم بتحديث الـ controller
                  controller.value = TextEditingValue(
                    text: newFormattedValue,
                    selection: TextSelection.collapsed(offset: newFormattedValue.length),
                  );
                }
              }
            },
          ),
        ),
      ),
    );
  }
}
