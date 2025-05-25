// ignore_for_file: unused_field, unused_local_variable, camel_case_types

import 'package:app_7/core/constants/ColorManager.dart';
import 'package:app_7/model/about_us_model.dart';
import 'package:app_7/presentation/widgets/custom_tex2.dart';
import 'package:flutter/material.dart';

class About_Us_Screen extends StatefulWidget {
  const About_Us_Screen({super.key});

  @override
  State<About_Us_Screen> createState() => _About_Us_ScreenState();
}

class _About_Us_ScreenState extends State<About_Us_Screen> {
  final TextEditingController subjectController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('من نحن', style: TextStyle(color: ColorManager.primary, fontWeight: FontWeight.bold)),
          centerTitle: true,
        ),
        backgroundColor: ColorManager.w_color,
        body: SingleChildScrollView(
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: List_about_us_model.length,
                    itemBuilder: (context, index) {
                      return CustomText(
                        text: List_about_us_model[index],
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        color: ColorManager.primary,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
