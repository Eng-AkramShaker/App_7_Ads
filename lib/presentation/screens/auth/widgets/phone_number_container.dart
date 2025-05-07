import 'package:app_7/presentation/screens/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:provider/provider.dart';
import 'package:app_7/core/constants/ColorManager.dart';

class PhoneContainer extends StatefulWidget {
  const PhoneContainer({super.key});

  @override
  State<PhoneContainer> createState() => _PhoneContainerState();
}

class _PhoneContainerState extends State<PhoneContainer> {
  @override
  Widget build(BuildContext context) {
    final crlHome = Provider.of<Controller_Home>(context, listen: false);

    return Container(
      margin: const EdgeInsets.only(left: 30.0, top: 30, right: 30.0),
      // height: 40.0,
      decoration: BoxDecoration(
        // color: Colors.black,
        borderRadius: const BorderRadius.all(Radius.circular(25.7)),

        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            spreadRadius: 5, //spread radius
            blurRadius: 8, // blur radius
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: IntlPhoneField(
        cursorColor: Colors.black,
        // textAlign: TextAlign.,
        style: const TextStyle(fontSize: 20.0, color: Colors.black),
        decoration: InputDecoration(
          filled: true,
          fillColor: ColorManager.primary,
          hintText: 'أدخل رقم الهاتف',
          contentPadding: const EdgeInsets.only(bottom: 25, top: 25),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(26),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(26),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(26),
          ),
        ),
        languageCode: "ar",
        onChanged: (phone) {
          setState(() {
            crlHome.phoneNumber = phone.completeNumber;
          });
        },
        onCountryChanged: (country) {
          print('Country changed to: ${country.name}');
        },
      ),
    );
  }
}
