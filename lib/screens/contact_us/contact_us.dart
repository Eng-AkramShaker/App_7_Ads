import 'package:app7ads/widgets/expansion_tile_item.dart';
import 'package:app7ads/widgets/socialIcons_row.dart';
import 'package:flutter/material.dart';
import 'package:motion_tab_bar/MotionTabBarController.dart';

import '../../constes/colormanager.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({Key? key, required this.controller}) : super(key: key);
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
                decoration: BoxDecoration(
                    color: ColorManager.b_69,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(72),
                        bottomLeft: Radius.circular(72))),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: size.height * 0.25,
                        width: size.width * 0.55,
                        child: Image.asset(
                          'assets/images/contactUs.png',
                        ),
                      ),
                      Text(
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
              SizedBox(
                height: 5,
              ),
              buildtextAndContainerItem(),
              buildSocialMedialIconsRow() ,
              SizedBox(height: 10,),
              ExpansionTileSubjectItem()

            ],
          ),
        ),
      ),
    );

  }
  buildtextAndContainerItem() {
    var size = MediaQuery
        .of(context)
        .size;
    return Column(
        children:
        [
          Text(
            ' *للشكاوي والاقتراحات*',
            style: TextStyle(
                color: ColorManager.b_69,
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
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
          SizedBox(
            height: 20,
          ),
          Text(
            ' *لارسال الصور والمرفقات*',
            style: TextStyle(
                color: ColorManager.b_69,
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
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
                    SizedBox(
                      width: 5.0,
                    ),
                    Image.asset(
                      'assets/images/wattssap.png',
                      height: 30,
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
          SizedBox(
            height: 10,
          ),
          Text(
            'تابعنا علي وسائل التواصل الاجتماعي :',
            style: TextStyle(color: ColorManager.b_69, fontSize: 15),
          ),
          SizedBox(
            height: 5.0,
          ),

        ]
    ) ;

  }
  }





