import 'package:flutter/material.dart';
import 'package:motion_tab_bar/MotionTabBarController.dart';
import 'package:todotask/presentation/screens/adsense/widgets/add_ads_pic.dart';
import 'package:todotask/presentation/screens/adsense/widgets/adress_container.dart';
import 'package:todotask/presentation/screens/adsense/widgets/describtion_container.dart';
import 'package:todotask/utils/components/components.dart';
import 'package:todotask/presentation/widgets/custom_tex2.dart';

import '../../../../utils/constants/ColorManager.dart';

class AddAds extends StatefulWidget {
  final MotionTabBarController controller;

  const AddAds({required this.controller, super.key});

  @override
  _AddAdsState createState() => _AddAdsState();
}

class _AddAdsState extends State<AddAds> {
  final addressController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffbfcfc),
      appBar: AppBar(
        title: const CustomText(
          text: 'اضافة اعلان',
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: ColorManager.primary,
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const AddAdsPicture(),
            const SizedBox(height: 30),
            CustomContainer(
              text: 'العنوان',
              icon: Icons.place,
            ),
            const SizedBox(height: 20),
            CustomContainer(
              text: 'وصف الاعلان ',
              icon: Icons.description,
            ),
            const SizedBox(height: 20),
            CustomContainer(
              text: ' اسم المنتج ',
              icon: Icons.text_fields,
            ),
            const SizedBox(height: 20),
            CustomContainer(
              text: ' سعر المنتج ',
              icon: Icons.price_check_outlined,
            ),
            const SizedBox(height: 20),
            CustomContainer(
              text: 'موديل  المنتج ',
              icon: Icons.category,
            ),
            SizedBox(height: .1 * MediaQuery.sizeOf(context).width),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: customButton(
                text: 'اضف الاعلان',
                onTap: () {},
                width: double.infinity,
                color: ColorManager.primary,
                textcolor: ColorManager.w_color,
                textSize: 20,
                height: MediaQuery.of(context).size.height * 0.09,
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    addressController.dispose();
    descriptionController.dispose();
    super.dispose();
  }
}
