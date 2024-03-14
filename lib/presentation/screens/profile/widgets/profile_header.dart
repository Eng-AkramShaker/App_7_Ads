import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todotask/presentation/screens/profile/widgets/info_item.dart';

import '../../../../utils/constants/ColorManager.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
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
    );
  }
}
