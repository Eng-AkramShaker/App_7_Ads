// ignore_for_file: camel_case_types

import 'package:app_7/core/constants/ColorManager.dart';
import 'package:app_7/model/terms_use_model.dart';
import 'package:app_7/presentation/widgets/custom_tex2.dart';
import 'package:flutter/material.dart';

class terms_useScreen extends StatelessWidget {
  final TextEditingController subjectController = TextEditingController();

  terms_useScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('شروط الأستخدام', style: TextStyle(color: ColorManager.primary, fontWeight: FontWeight.bold)),
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
                    itemCount: Terms_Use_Model.length,
                    itemBuilder: (context, index) {
                      return CustomText(
                        text: Terms_Use_Model[index],
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
