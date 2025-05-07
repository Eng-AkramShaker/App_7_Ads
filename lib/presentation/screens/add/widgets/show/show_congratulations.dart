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
    widget: Container(
      height: height_media(context) / 4,
      child: Consumer<Add_Controller>(builder: (context, proAdd, child) {
        return Column(
          children: [
            CustomText(text: 'تهانينا', fontSize: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 30),
                CustomText(text: " لقد قمت الإن بتنزيل إعلانك *", fontSize: 14),
                const SizedBox(height: 10),
                CustomText(text: 'يمكنك الأن متابعة إعلانك وموعد ظهوره وإنتهاءه من جرس الإشعارات ', fontSize: 14),
                const SizedBox(height: 30),
                Center(child: CustomText(text: 'شكرا لإختيارك كناري', fontSize: 17)),
              ],
            ),
          ],
        );
      }),
    ),
    onPressed: () async {
      //

      await pop(context);
    },
  );
}
