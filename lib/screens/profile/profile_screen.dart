import 'package:flutter/material.dart';
import 'package:todotask/constes/ColorManager.dart';
import 'package:todotask/widgets/info_item.dart';

import '../../widgets/custom_tex2.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: ColorManager.b_69.withOpacity(0.9),
          title: const CustomText(
            text: 'حـسـابـي',
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: ColorManager.primary,
          ),
        ),
        body: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: ColorManager.b_69.withOpacity(0.9),
                  borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(40), bottomRight: Radius.circular(40))),
              child: Column(
                children: [
                  const SizedBox(height: 15),
                  Stack(
                    children: [
                      Positioned(
                        left: 3,
                        child: Stack(
                          clipBehavior: Clip.none,
                          alignment: Alignment.bottomRight,
                          children: [
                            CircleAvatar(
                              radius: 50,
                              backgroundColor: ColorManager.w_color,
                              child: CircleAvatar(
                                radius: 50,
                                child: Image.asset(
                                  'assets/images/user.png',
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: -12,
                              right: 20,
                              child: CircleAvatar(
                                  radius: 17,
                                  backgroundColor: ColorManager.primary.withOpacity(0.9),
                                  child: const Icon(
                                    Icons.camera_alt,
                                    color: ColorManager.b_69,
                                    size: 20,
                                  )),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, right: 15),
                        child: Column(
                          children: [
                            infoItem(
                              infoKey: 'الاسم :',
                              infoValue: ' عبدالرحمن محمد عباس',
                            ),
                            infoItem(
                              infoKey: 'النوع :',
                              infoValue: 'ذكر',
                            ),
                            infoItem(
                              infoKey: 'السن :',
                              infoValue: '23',
                            ),
                            infoItem(
                              infoKey: 'رقم التليفون :',
                              infoValue: '01146580668',
                            ),
                            infoItem(
                              infoKey: 'الايميل :',
                              infoValue: 'abdelrahman@gamail.com',
                            ),
                            infoItem(
                              infoKey: 'المحافظه والمنطقه :',
                              infoValue: 'القاهره - مدينة نصر',
                            ),
                            const SizedBox(height: 40),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: size.height * 0.26,
                    width: size.width * 0.35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: ColorManager.b_69,
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        CustomText(
                          text: 'المحفظه والرصيد :',
                          color: ColorManager.primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        CustomText(
                          text: '87',
                          color: ColorManager.primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 38,
                        ),
                        CustomText(
                          text: 'جنيها فقط لا غير',
                          color: ColorManager.primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: size.height * 0.26,
                    width: size.width * 0.35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: ColorManager.b_69,
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        CustomText(
                          text: 'النقاط :',
                          color: ColorManager.primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        CustomText(
                          text: '15',
                          color: ColorManager.primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 38,
                        ),
                        CustomText(
                          text: 'نقطه فقط',
                          color: ColorManager.primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
