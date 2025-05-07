// ignore_for_file: camel_case_types, avoid_print, unused_local_variable, non_constant_identifier_names

import 'package:app_7/presentation/widgets/custom_tex2.dart';
import 'package:flutter/material.dart';
import 'package:app_7/core/constants/ColorManager.dart';

class Notifications_Screen extends StatefulWidget {
  const Notifications_Screen({super.key});

  @override
  State<Notifications_Screen> createState() => _Notifications_ScreenState();
}

class _Notifications_ScreenState extends State<Notifications_Screen> {
  int startDate = 0;

  int endDate = 3;

  int difference = 0;

  @override
  void initState() {
    super.initState();

    intS();
  }

  intS() {
    setState(() {
      difference = endDate - startDate;
    });

    // print(difference);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text('الاشعارات', style: TextStyle(color: ColorManager.primary, fontWeight: FontWeight.bold)),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(19),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  //
                  const SizedBox(height: 40),

                  Container(
                    width: size.width,
                    decoration: BoxDecoration(
                      border: Border.all(color: ColorManager.primary),
                      borderRadius: BorderRadius.circular(13),
                      color: Colors.white,
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CustomText(
                            text: "أضافة 5 معجبين بأعلانك إلي المفضلة لديهم",
                            color: ColorManager.primary,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  //

                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: ColorManager.primary),
                      borderRadius: BorderRadius.circular(13),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          build_Days_Difference(context, size, totalDays: 7, currentDay: difference),
                          const SizedBox(height: 10),
                          CustomText(
                            text: "اليوم هو:   $difference  لإعلانك",
                            color: ColorManager.primary,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  //

                  Container(
                    width: size.width,
                    decoration: BoxDecoration(
                      border: Border.all(color: ColorManager.primary),
                      borderRadius: BorderRadius.circular(13),
                      color: Colors.white,
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              CustomText(
                                text: 'Am 8.10',
                                color: ColorManager.primary,
                                fontWeight: FontWeight.bold,
                              ),
                              CustomText(
                                text: '2024/09/18',
                                color: ColorManager.primary,
                                fontWeight: FontWeight.bold,
                              ),
                              CustomText(
                                text: ': بداية الأعلان ',
                                color: ColorManager.primary,
                                fontWeight: FontWeight.bold,
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              CustomText(
                                text: 'Am 8.10',
                                color: ColorManager.primary,
                                fontWeight: FontWeight.bold,
                              ),
                              CustomText(
                                text: '2024/09/18',
                                color: ColorManager.primary,
                                fontWeight: FontWeight.bold,
                              ),
                              CustomText(
                                text: ': إنتهاء الأعلان ',
                                color: ColorManager.primary,
                                fontWeight: FontWeight.bold,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget build_Days_Difference(BuildContext context, Size size, {required int totalDays, required int currentDay}) {
    return SizedBox(
      width: size.width,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(totalDays, (index) {
            bool isMarked = index < currentDay;
            return Container(
              margin: const EdgeInsets.all(4.0),
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                border: Border.all(color: ColorManager.primary),
                borderRadius: BorderRadius.circular(8.0),
                color: isMarked ? ColorManager.primary.withOpacity(0.2) : Colors.transparent,
              ),
              child: Text(
                isMarked ? '✓' : '☐',
                style: const TextStyle(fontSize: 24),
              ),
            );
          }),
        ),
      ),
    );
  }
}
