// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:motion_tab_bar/MotionTabBarController.dart';
import 'package:todotask/components/components.dart';
import 'package:todotask/widgets/custom_tex2.dart';
import 'package:todotask/widgets/custom_text_field.dart';

import '../../constes/ColorManager.dart';

class AddAds extends StatefulWidget {
  AddAds({required this.controller, super.key});

  final MotionTabBarController controller;

  var addressController = TextEditingController();
  var descriptionController = TextEditingController();

  @override
  State<AddAds> createState() => _AddAdsState();
}

class _AddAdsState extends State<AddAds> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const CustomText(
          text: 'اضافة اعلان',
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: ColorManager.primary,
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: ColorManager.b_69.withOpacity(0.9),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.2,
              decoration: BoxDecoration(
                border: Border.all(color: ColorManager.b_69, width: 2),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    text: 'أضف صورة الاعلان',
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: ColorManager.b_69,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CircleAvatar(
                      backgroundColor: ColorManager.b_69,
                      child: Icon(
                        Icons.add,
                        color: ColorManager.w_color,
                      )),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 13, right: 13),
            child: CustomTextField(
              height: 50,
              centerText: true,
              lableStyle: const TextStyle(
                fontSize: 15,
                color: ColorManager.b_69,
              ),
              lable: ' العنوان  ',
              controller: widget.addressController,
              borderColor: ColorManager.b_69,
              hasBorder: true,
              radius: 10,
              style: const TextStyle(color: ColorManager.b_69, fontSize: 15),
              textInputType: TextInputType.text,
              icon: const Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: CircleAvatar(
                  radius: 15,
                  backgroundColor: ColorManager.b_69,
                  child: Icon(
                    Icons.place,
                    color: ColorManager.w_color,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 13, right: 13),
            child: CustomTextField(
              centerText: true,
              lableStyle: const TextStyle(
                fontSize: 15,
                color: ColorManager.b_69,
              ),
              lable: 'وصف الاعلان ',
              controller: widget.descriptionController,
              borderColor: ColorManager.b_69,
              hasBorder: true,
              radius: 10,
              style: const TextStyle(color: ColorManager.b_69, fontSize: 15),
              textInputType: TextInputType.text,
              icon: const Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: CircleAvatar(
                  radius: 15,
                  backgroundColor: ColorManager.b_69,
                  child: Icon(
                    Icons.text_fields,
                    color: ColorManager.w_color,
                  ),
                ),
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: myButton(
              text: 'اضف الاعلان',
              onTap: () {},
              width: double.infinity,
              color: ColorManager.b_69,
              textcolor: ColorManager.w_color,
              textSize: 20,
              height: MediaQuery.of(context).size.height * 0.09,
            ),
          ),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
