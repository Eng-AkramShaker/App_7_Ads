// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors, unnecessary_import

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../constes/ColorManager.dart';
import '../../widgets/custom_button.dart';
import '../auth/register.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorManager.w_FA,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 32),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                'assets/images/illustration-1.png',
                width: 180,
              ),
              const SizedBox(
                height: 18,
              ),
              const Text(
                "Let's get started",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: ColorManager.b_69,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Never a better time than now to start.",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: ColorManager.b_69,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 40,
              ),
              InkWell(
                onTap: () {
                  Get.to(const Register());
                },
                child: Center(
                  child: Container(
                    width: 500,
                    height: 60,
                    decoration: BoxDecoration(
                      color: ColorManager.b_69,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.4),
                          spreadRadius: 5, //spread radius
                          blurRadius: 8, // blur radius
                          offset: const Offset(0, 0),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        'التسجيل',
                        style: const TextStyle(
                          color: ColorManager.w_FA,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Tajawal',
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 38,
              ),
              InkWell(
                onTap: () {
                  //

                  // Get.to(const Otp());
                },
                child: Custom_Button(h: 60, w: 300, text: 'تسجيل الدخول'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
