import 'package:flutter/material.dart';
import 'package:motion_tab_bar/MotionTabBarController.dart';
import 'package:todotask/presentation/screens/contact_us/widgets/buildText.dart';
import 'package:todotask/presentation/screens/contact_us/widgets/expansion_tile_item.dart';
import 'package:todotask/presentation/screens/contact_us/widgets/socialIcons_row.dart';
import 'package:todotask/utils/constants/ColorManager.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({super.key, required this.controller});
  final MotionTabBarController controller;

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: size.height * 0.35,
                decoration: BoxDecoration(
                    border: Border.all(color: ColorManager.primary),
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(72),
                        bottomLeft: Radius.circular(72))),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        height: size.height * 0.22,
                        width: size.width * 0.55,
                        child: Image.asset(
                          'assets/images/contactUs.png',
                        ),
                      ),
                      const Text(
                        'تواصل معنا',
                        style: TextStyle(
                          color: ColorManager.primary,
                          fontWeight: FontWeight.w600,
                          fontSize: 30,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              buildtextAndContainerItem(),
              const BuildSocialMedialIconsRow(),
              const SizedBox(
                height: 10,
              ),
              const ExpansionTileSubjectItem()
            ],
          ),
        ),
      ),
    );
  }

  buildtextAndContainerItem() {
    return const BuildTextBody();
  }
}
