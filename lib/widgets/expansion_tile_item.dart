import 'package:todotask/constes/ColorManager.dart';
import 'package:expansion_tile_group/expansion_tile_group.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'custom_tex2.dart';

class ExpansionTileSubjectItem extends StatelessWidget {
  const ExpansionTileSubjectItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: ExpansionTileBorderItem(
        trailing: const Icon(
          Icons.arrow_drop_down,
          color: Colors.white,
          size: 30,
        ),
        // leading: Icon(Icons.arrow_downward_sharp,color: Colors.white,),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 20,
              blurRadius: 20,
              offset: const Offset(0, 3),
            ),
          ],
          borderRadius: BorderRadius.circular(16),
          color: ColorManager.b_69,
        ),
        title: const CustomText(text: 'الشروط والاحكام', color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        expendedBorderColor: Colors.black,
        iconColor: ColorManager.b_69,
        collapsedIconColor: ColorManager.b_69,
        children: [
          Column(
            children: [
              Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CustomText(
                            color: Colors.white,
                            text: 'يجب ان تفهم شروط التطبيق جيدا قبل الاستخدام :',
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ],
                      ),
                    ],
                  ),
                  ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    children: const [
                      CustomText(
                          text: '1- أن لا يكون الإعلان منافي للآداب العامة ', color: ColorManager.w_color, maxLines: 2, fontSize: 15),
                      CustomText(
                          text: '2- عدم إنتهاك خصوصية الآخرين وبياناتهم', color: ColorManager.w_color, maxLines: 2, fontSize: 15),
                      CustomText(
                          text: '3- أن لا يكون الإعلان خادش للحياء وأن يكون خالي من الإيحاءات الجنسية',
                          color: ColorManager.w_color,
                          maxLines: 2,
                          fontSize: 15),
                      CustomText(
                          text: '4- أن لا يتضمن العنف والإرهاب والإيزاء النفسي والجسدي ',
                          color: ColorManager.w_color,
                          maxLines: 2,
                          fontSize: 15),
                      CustomText(
                          text: '5- عدم إزدراء الأديان والمذاهب والمعتقدات', color: ColorManager.w_color, maxLines: 2, fontSize: 15),
                      CustomText(
                          text: '6- كتابة كافة التفاصيل والسعر والوصف والحالة للمنتج داخل الإعلان',
                          color: ColorManager.w_color,
                          maxLines: 2,
                          fontSize: 15),
                      CustomText(
                          text: '7- أن لا يكون الإعلان وهميٱ أو منتج غير موجود ',
                          color: ColorManager.w_color,
                          maxLines: 2,
                          fontSize: 15),
                      CustomText(
                          text: '8- أن لا يكون الإعلان عن نشاط ترويجي للمخدرات أو التشجيع عليها',
                          color: ColorManager.w_color,
                          maxLines: 2,
                          fontSize: 15),
                      CustomText(
                          text: '9- إقرار المعلن أو المستخدم بمسؤليته عن المخالفات القانونية و العواقب الإجتماعية',
                          color: ColorManager.w_color,
                          maxLines: 2,
                          fontSize: 15),
                      CustomText(
                          text: '10- أن لا يتضمن الإعلان التشهير الإيزاء لأي شخص أو نشاط',
                          color: ColorManager.w_color,
                          maxLines: 2,
                          fontSize: 15),
                      CustomText(
                          text: '11- الإقرار باستخدام رقم هاتف شخصي او شركات حقيقي وإمتلاكه رسمياً',
                          color: ColorManager.w_color,
                          maxLines: 2,
                          fontSize: 15),
                      CustomText(
                          text: '12- عدم التلاعب أو استخدام أي روبوت أو زكاء إصطناعي داخل التطبيق',
                          color: ColorManager.w_color,
                          maxLines: 2,
                          fontSize: 15),
                      CustomText(
                          text: '13- البرنامج غير مسؤول نهائيا عن الإعلان ومحتواه أو زيادة أو تقليل الأرباح بشكل مباشر أو غير مباشر',
                          color: ColorManager.w_color,
                          maxLines: 2,
                          fontSize: 15),
                      CustomText(
                          text:
                              '14- يمنحك البرنامج ميزة إضافة وتنزيل اعلانات سواء مجانية أو مموله ومدفوعة كرسوم بمبلغ غير مسترد ( وذلك وفقاً لسياستنا حسب الإعلان عنها ) ',
                          color: ColorManager.w_color,
                          maxLines: 2,
                          fontSize: 15),
                      CustomText(
                          text:
                              '15- يتحمل المعلن المسؤولية الكاملة في أي انتهاك لحقوق الطباعة والنشر والتوزيع والملكية الفكرية والأدبية وغيرها ',
                          color: ColorManager.w_color,
                          maxLines: 2,
                          fontSize: 15),
                      CustomText(
                          text:
                              '16- السماح لنا بالإطلاع على بياناتك الشخصية للتأكد من صحة المعلومات وهوية المعلن أو المستخدم والإعلان عنها للجهات الأمنية الرسمية المختصة في حالة المخالفات إذا لزم الأمر,color: ColorManager.w_color,maxLines: 2,fontSize: 15',
                          color: ColorManager.w_color,
                          maxLines: 2,
                          fontSize: 15),
                      CustomText(
                          text:
                              '17- إقرار المعلن عن مسؤوليته مسؤليه كاملة في الحصول على أي مبالغ مالية من المستخدمين وردها إليهم في حالة عدم إتمام صفقة الشراء',
                          color: ColorManager.w_color,
                          maxLines: 2,
                          fontSize: 15),
                      CustomText(
                          text:
                              '18- الإقرار بعدم الحصول على أي أموال من المستخدمين واستغلالهم على سبيل توظيف الأموال أو غسيل الأموال وغيرها',
                          color: ColorManager.w_color,
                          maxLines: 2,
                          fontSize: 15),
                      CustomText(
                          text:
                              '19- الإقرار بصحة بيانات المعلن أو المستخدم كاملة من أرقام هواتف وعناوين وتحمل المسئولية الكاملة وتبعياتها',
                          color: ColorManager.w_color,
                          maxLines: 2,
                          fontSize: 15),
                      CustomText(
                          text:
                              '20- إقرار المعلن أو المستخدم بأنه شخص بالغ عاقل فوق السن القانونية قادراً على التعاقد مع الآخرين وتحمل المسئولية',
                          color: ColorManager.w_color,
                          maxLines: 2,
                          fontSize: 15)
                    ],
                  ),
                  // ListView.builder(
                  //   scrollDirection: Axis.vertical,
                  //   shrinkWrap: true,
                  //   itemBuilder: (context, index) {
                  //     return CustomText(text: '- يجب دفع العموله المقرره في حاله التعامل خارج نطاق التطبيق',
                  //       fontWeight: FontWeight.w600,
                  //       fontSize: 14,
                  //       color: Colors.white,
                  //
                  //     );
                  //   },
                  //   itemCount: 7,
                  // ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
