import 'package:app_7/presentation/screens/profile/widgets/points_container.dart';
import 'package:app_7/presentation/screens/profile/widgets/wallet_container.dart';
import 'package:flutter/material.dart';
import 'package:motion_tab_bar/MotionTabBarController.dart';
import 'package:app_7/core/constants/ColorManager.dart';

import '../widgets/profile_header.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({required this.controller, super.key});

  final MotionTabBarController controller;
  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            'حـسـابـي',
            style: TextStyle(
              color: ColorManager.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: ColorManager.w_color,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.only(top: 30),
                child: ProfileHeader(),
              ),
            ),
            const SizedBox(height: 40.0),
            const Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PointsContainer(),
                  WaletContainer(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
