// ignore_for_file: unused_field, unused_local_variable, camel_case_types, unused_element

import 'package:app_7/core/constants/ColorManager.dart';
import 'package:app_7/presentation/screens/more/contact%20us/widgets/buildText.dart';
import 'package:app_7/presentation/screens/more/contact%20us/widgets/socialIcons_row.dart';
import 'package:flutter/material.dart';

class Contact_Us_Screen extends StatefulWidget {
  const Contact_Us_Screen({super.key});

  @override
  State<Contact_Us_Screen> createState() => _Contact_Us_ScreenState();
}

class _Contact_Us_ScreenState extends State<Contact_Us_Screen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('تواصل معنا', style: TextStyle(color: ColorManager.primary, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: size.height * 0.35,
              decoration: BoxDecoration(
                  border: Border.all(color: ColorManager.primary),
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(bottomRight: Radius.circular(72), bottomLeft: Radius.circular(72))),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 15),
                    SizedBox(
                      height: size.height * 0.22,
                      width: size.width * 0.55,
                      child: Image.asset('assets/images/contactUs.png'),
                    ),
                    const Text('تواصل معنا', style: TextStyle(color: ColorManager.primary, fontWeight: FontWeight.w600, fontSize: 30)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 80),
            const BuildTextBody(),
            const SizedBox(height: 30),
            const BuildSocialMedialIconsRow(),
          ],
        ),
      ),
    );
  }
}
