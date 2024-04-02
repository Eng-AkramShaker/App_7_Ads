import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:motion_tab_bar/MotionTabBarController.dart';
import 'package:todotask/presentation/screens/adsense/widgets/add_ads_pic.dart';
import 'package:todotask/presentation/screens/adsense/widgets/adress_container.dart';
import 'package:todotask/presentation/screens/adsense/widgets/describtion_container.dart';
import 'package:todotask/presentation/screens/home/screens/home_screen.dart';
import 'package:todotask/presentation/screens/home/widgets/home_body.dart';
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
  TextEditingController description = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController location = TextEditingController();
  TextEditingController model = TextEditingController();
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
              controller: location,
            ),
            const SizedBox(height: 20),
            CustomContainer(
              text: 'وصف الاعلان ',
              icon: Icons.description,
              controller: description,
            ),
            const SizedBox(height: 20),
            CustomContainer(
              text: ' اسم المنتج ',
              icon: Icons.text_fields,
              controller: name,
            ),
            const SizedBox(height: 20),
            CustomContainer(
              text: ' سعر المنتج ',
              icon: Icons.price_check_outlined,
              controller: price,
            ),
            const SizedBox(height: 20),
            CustomContainer(
              text: 'موديل  المنتج ',
              icon: Icons.category,
              controller: model,
            ),
            SizedBox(height: .1 * MediaQuery.sizeOf(context).width),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: customButton(
                text: 'اضف الاعلان',
                onTap: () async {
                  await _uploadData();
                },
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

  Future<void> _uploadData() async {
    try {
      // Get a reference to the Firestore database
      FirebaseFirestore firestore = FirebaseFirestore.instance;

      // Add data to a collection
      await firestore.collection('advertisementcards').add({
        'name': name.text,
        'description': description.text,
        'price': price.text,
        'location': location.text,
        'model': model.text,
      });

      // Clear the text field after uploading
      name.clear();
      description.clear();
      price.clear();
      location.clear();
      model.clear();

      // Show a success message
      CustomSnackBar(context, "uploaded data successfuly", Colors.green);
    } catch (e) {
      // Show an error message if uploading fails
      CustomSnackBar(context, 'Error uploading data: $e', Colors.red);
    }
  }

  @override
  void dispose() {
    addressController.dispose();
    descriptionController.dispose();
    super.dispose();
  }
}
