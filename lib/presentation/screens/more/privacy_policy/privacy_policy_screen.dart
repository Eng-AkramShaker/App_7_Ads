// ignore_for_file: unused_field, unused_local_variable, camel_case_types

import 'package:app_7/core/constants/ColorManager.dart';
import 'package:app_7/model/privacy_policy_model.dart';
import 'package:app_7/presentation/widgets/custom_tex2.dart';
import 'package:flutter/material.dart';

class Privacy_Policy_Screen extends StatefulWidget {
  const Privacy_Policy_Screen({super.key});

  @override
  State<Privacy_Policy_Screen> createState() => _Privacy_Policy_Screen_ScreenState();
}

class _Privacy_Policy_Screen_ScreenState extends State<Privacy_Policy_Screen> {
  final TextEditingController subjectController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('سياسة الخصوصية', style: TextStyle(color: ColorManager.primary, fontWeight: FontWeight.bold)),
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
                    itemCount: List_privacy_policy.length,
                    itemBuilder: (context, index) {
                      return CustomText(
                        text: List_privacy_policy[index],
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
