import 'package:flutter/material.dart';
import 'package:motion_tab_bar/MotionTabBarController.dart';
import 'package:todotask/widgets/expansion_tile_item.dart';
import 'package:todotask/widgets/socialIcons_row.dart';

import '../../constes/colormanager.dart';

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
        // appBar:AppBar(
        //   elevation: 0,
        //   backgroundColor: ColorManager.b_69,
        //   title: Text(''),
        //   centerTitle: true,
        // ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: size.height * 0.35,
                decoration: const BoxDecoration(
                    color: ColorManager.b_69,
                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(72), bottomLeft: Radius.circular(72))),
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
                          color: Colors.white,
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
              const buildSocialMedialIconsRow(),
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
    var size = MediaQuery.of(context).size;
    return Column(children: [
      const Text(
        ' *للشكاوي والاقتراحات*',
        style: TextStyle(color: ColorManager.b_69, fontSize: 18, fontWeight: FontWeight.bold),
      ),
      const SizedBox(
        height: 8,
      ),
      Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Container(
          height: size.height * 0.07,
          width: double.infinity,
          decoration: BoxDecoration(
              border: Border.all(
                color: ColorManager.b_69,
                width: 0.5,
              ),
              borderRadius: BorderRadius.circular(15)),
          child: const Padding(
            padding: EdgeInsets.only(left: 15.0, right: 15.0),
            child: Row(
              children: [
                Text(
                  'رقم خدمة العملاء ',
                  style: TextStyle(
                    color: ColorManager.b_69,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Icon(
                  Icons.phone,
                  size: 30,
                  color: ColorManager.b_69,
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(' : '),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  '01146580668',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
      const SizedBox(
        height: 20,
      ),
      const Text(
        ' *لارسال الصور والمرفقات*',
        style: TextStyle(color: ColorManager.b_69, fontSize: 18, fontWeight: FontWeight.bold),
      ),
      const SizedBox(
        height: 8,
      ),
      Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Container(
          height: size.height * 0.07,
          width: double.infinity,
          decoration: BoxDecoration(
              border: Border.all(
                color: ColorManager.b_69,
                width: 0.5,
              ),
              borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0),
            child: Row(
              children: [
                const Text(
                  'واتس اب',
                  style: TextStyle(
                    color: ColorManager.b_69,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  width: 5.0,
                ),
                Image.asset(
                  'assets/images/wattssap.png',
                  height: 30,
                ),
                const SizedBox(
                  width: 10.0,
                ),
                const Text(' : '),
                const SizedBox(
                  width: 10.0,
                ),
                const Text(
                  '01146580668',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      const Text(
        'تابعنا علي وسائل التواصل الاجتماعي :',
        style: TextStyle(color: ColorManager.b_69, fontSize: 15),
      ),
      const SizedBox(
        height: 5.0,
      ),
    ]);
  }
}
