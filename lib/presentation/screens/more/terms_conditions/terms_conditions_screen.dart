// ignore_for_file: unused_field, unused_local_variable, camel_case_types

import 'package:app_7/core/constants/ColorManager.dart';
import 'package:app_7/model/terms_conditions_model.dart';
import 'package:app_7/presentation/widgets/custom_tex2.dart';
import 'package:flutter/material.dart';

class Terms_Conditions_Screen extends StatefulWidget {
  const Terms_Conditions_Screen({super.key});

  @override
  State<Terms_Conditions_Screen> createState() => _Terms_Conditions_Screen_ScreenState();
}

class _Terms_Conditions_Screen_ScreenState extends State<Terms_Conditions_Screen> {
  final TextEditingController subjectController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('الشروط والأحكام', style: TextStyle(color: ColorManager.primary, fontWeight: FontWeight.bold)),
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
                    itemCount: List_terms_conditions_model.length,
                    itemBuilder: (context, index) {
                      return CustomText(
                        text: List_terms_conditions_model[index],
                        fontWeight: FontWeight.w600,
                        fontSize: 17,
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
