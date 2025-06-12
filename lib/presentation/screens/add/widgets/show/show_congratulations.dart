// ignore_for_file: non_constant_identifier_names

import 'package:app_7/core/constants/app_sizes.dart';
import 'package:app_7/core/constants/navigators.dart';
import 'package:app_7/core/constants/show_dialog.dart';
import 'package:app_7/presentation/screens/add/controller/add_controller.dart';
import 'package:app_7/presentation/widgets/custom_tex2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Show_Congratulations_Dialog(context) {
  Snack_Select_Menu(
    context: context,
    button_tex: 'موافق',
    widget: SizedBox(
      height: height_media(context) / 3.5,
      child: Consumer<Add_Controller>(builder: (context, proAdd, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),

            // 🎉 تهنئة مع أيقونة
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.celebration, color: Colors.orange, size: 28),
                SizedBox(width: 6),
                CustomText(text: 'تهانينا', fontSize: 20, fontWeight: FontWeight.bold),
                SizedBox(width: 6),
                Icon(Icons.celebration, color: Colors.orange, size: 28),
              ],
            ),

            const SizedBox(height: 40),

            // 🎊 نص التهنئة
            Center(
              child: CustomText(
                text: "🎉 لقد قمت الآن بتنزيل إعلانك بنجاح 🎉",
                fontSize: 14,
                textAlign: TextAlign.center,
              ),
            ),

            const SizedBox(height: 12),

            // 🔔 الإشعارات
            Center(
              child: CustomText(
                text: 'يمكنك الآن متابعة إعلانك وموعد ظهوره وانتهائه من جرس الإشعارات 🔔',
                fontSize: 13,
                textAlign: TextAlign.center,
              ),
            ),

            const SizedBox(height: 25),

            // 💛 شكر
            Center(
              child: CustomText(
                text: '💛 شكراً لاختيارك كناري 💛',
                fontSize: 16,
                fontWeight: FontWeight.w500,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        );
      }),
    ),
    onPressed: () async {
      await pop(context);
    },
  );
}
