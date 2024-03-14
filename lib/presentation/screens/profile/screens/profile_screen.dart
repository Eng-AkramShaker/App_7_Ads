import 'package:flutter/material.dart';
import 'package:todotask/presentation/screens/profile/widgets/points_container.dart';
import 'package:todotask/presentation/screens/profile/widgets/profile_header.dart';
import 'package:todotask/presentation/screens/profile/widgets/wallet_container.dart';
import 'package:todotask/utils/constants/ColorManager.dart';

import '../../../widgets/custom_tex2.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
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
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40))),
              child: const Column(
                children: [SizedBox(height: 15), ProfileHeader()],
              ),
            ),
            const SizedBox(
              height: 40.0,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [WaletContainer(), PointsContainer()],
              ),
            )
          ],
        ),
      ),
    );
  }
}
