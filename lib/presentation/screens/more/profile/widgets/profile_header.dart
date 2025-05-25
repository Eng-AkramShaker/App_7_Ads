import 'package:flutter/material.dart';
import '../../../../../core/constants/ColorManager.dart';
import 'info_item.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: ColorManager.w_color,
              child: CircleAvatar(
                radius: 50,
                child: Image.asset('assets/images/user.png'),
              ),
            ),
            Positioned(
              bottom: -12,
              right: 13,
              child: CircleAvatar(
                radius: 17,
                backgroundColor: ColorManager.primary.withOpacity(0.9),
                child: const Icon(
                  Icons.camera_alt,
                  color: ColorManager.w_color,
                  size: 20,
                ),
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10, right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              infoItem(
                infoKey: ' عبدالرحمن محمد عباس',
                infoValue: ' : الاسم',
              ),
              infoItem(
                infoKey: 'ذكر',
                infoValue: ' :النوع',
              ),
              infoItem(
                infoKey: '23',
                infoValue: ': السن',
              ),
              infoItem(
                infoKey: '01146580668',
                infoValue: ': رقم التليفون ',
              ),
              infoItem(
                infoKey: 'abdelrahman@gamail.com',
                infoValue: ': الايميل',
              ),
              infoItem(
                infoKey: ': القاهره - مدينة نصر',
                infoValue: ' : المحافظه والمنطقه',
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ],
    );
  }
}
