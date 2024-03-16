import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todotask/presentation/widgets/custom_tex2.dart';
import 'package:todotask/utils/constants/ColorManager.dart';

class AddAdsPicture extends StatelessWidget {
  const AddAdsPicture({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.2,
        decoration: BoxDecoration(
          border: Border.all(color: ColorManager.primary, width: 2),
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(
              text: 'أضف صورة الاعلان',
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: ColorManager.grayColor,
            ),
            SizedBox(
              height: 10,
            ),
            CircleAvatar(
                backgroundColor: ColorManager.primary,
                child: Icon(
                  Icons.add,
                  color: ColorManager.w_color,
                )),
          ],
        ),
      ),
    );
  }
}
