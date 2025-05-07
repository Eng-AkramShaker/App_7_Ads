// ignore_for_file: deprecated_member_use, unused_import, non_constant_identifier_names, duplicate_ignore

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:app_7/core/constants/ColorManager.dart';
import 'package:url_launcher/url_launcher.dart';

class BuildTextBody extends StatefulWidget {
  const BuildTextBody({super.key});

  @override
  State<BuildTextBody> createState() => _BuildTextBodyState();
}

class _BuildTextBodyState extends State<BuildTextBody> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Column(
      children: [
        const SizedBox(height: 20),
        const Text(
          ' *للشكاوي والاقتراحات*',
          style: TextStyle(
            color: ColorManager.primary,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 28),
        InkWell(
          onTap: () async {
            //
            open_Whatsapp(context);
          },
          child: buildContactRow(size, 'خدمة العملاء', '01205999599', Icons.phone),
        ),
        const SizedBox(height: 10),
        const Text('تابعنا علي وسائل التواصل الاجتماعي :', style: TextStyle(color: ColorManager.grayColor, fontSize: 15)),
        const SizedBox(height: 5.0),
      ],
    );
  }
}

Widget buildContactRow(Size size, String title, String value, IconData icon) {
  return Padding(
    padding: const EdgeInsets.only(left: 20, right: 20),
    child: Container(
      height: size.height * 0.07,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          color: ColorManager.primary,
          width: 0.5,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Row(
          children: [
            SizedBox(
              width: 100,
              child: Text(
                title,
                style: const TextStyle(
                  color: ColorManager.grayColor,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(width: 10.0),
            // Icon(
            //   icon,
            //   size: 30,
            //   color: ColorManager.primary,
            // ),

            CircleAvatar(backgroundColor: Colors.red, radius: 15, child: Image.asset('assets/images/wattssap.png')),
            const SizedBox(width: 10.0),
            const Text(' : '),
            const SizedBox(width: 10.0),
            Text(
              value,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    ),
  );
}

// ignore: non_constant_identifier_names

open_Whatsapp(context) async {
  var whatsappurlAndroid = "https://api.whatsapp.com/send/?phone=%2B201205999599&text&app_absent=0";

  var whatappurlIos = "https://api.whatsapp.com/send/?phone=%2B201205999599&text&app_absent=0";

  if (Platform.isIOS) {
    if (await canLaunch(whatappurlIos)) {
      await launch(whatappurlIos, forceSafariVC: false);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("whatsapp no installed")));
    }
  } else {
    if (await canLaunch(whatsappurlAndroid)) {
      await launch(whatsappurlAndroid);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("whatsapp no installed")));
    }
  }
}
