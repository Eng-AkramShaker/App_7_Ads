import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todotask/utils/constants/ColorManager.dart';

class BuildTextBody extends StatelessWidget {
  const BuildTextBody({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    Widget buildContactRow(String title, String value, IconData icon) {
      return Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Container(
          height: size.height * 0.07,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(
              color: ColorManager.primary,
              width: 0.5,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: ColorManager.grayColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(width: 10.0),
                Icon(
                  icon,
                  size: 30,
                  color: ColorManager.primary,
                ),
                const SizedBox(width: 10.0),
                const Text(' : '),
                const SizedBox(width: 10.0),
                Text(
                  value,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return Column(
      children: [
        const SizedBox(height: 20),
        const Text(
          ' *للشكاوي والاقتراحات*',
          style: TextStyle(
            color: ColorManager.primary,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        buildContactRow(
          'رقم خدمة العملاء',
          '01146580668',
          Icons.phone,
        ),
        const SizedBox(height: 20),
        const Text(
          ' *لارسال الصور والمرفقات*',
          style: TextStyle(
            color: ColorManager.primary,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        buildContactRow(
          'واتس اب',
          '01146580668',
          Icons.image,
        ),
        const SizedBox(height: 10),
        const Text(
          'تابعنا علي وسائل التواصل الاجتماعي :',
          style: TextStyle(color: ColorManager.grayColor, fontSize: 15),
        ),
        const SizedBox(height: 5.0),
      ],
    );
  }
}
