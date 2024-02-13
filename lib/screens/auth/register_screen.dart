// ignore_for_file: library_private_types_in_public_api, unnecessary_import, avoid_print

import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:provider/provider.dart';
import '../../constes/colormanager.dart';
import '../../constes/navigators.dart';
import '../../controller/home_controller.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_container.dart';
import '../../widgets/custom_text.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  void initState() {
    super.initState();
    inits();
  }

  inits() async {
    //
  }

  // ------------------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    final crlHome = Provider.of<Controller_Home>(context, listen: false);

    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: ColorManager.w_F8,
          ),
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Column(
                  children: [
                    Text(crlHome.counter.toString()),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, top: 20, bottom: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              //
                              pop(context);
                            },
                            child: custom_Container(h: 45, w: 45.0),
                          ),
                          InkWell(
                            onTap: () {
                              //
                            },
                            child: Custom_Text(
                                text: 'تخطي',
                                size: 24,
                                color: ColorManager.b_69),
                          ),
                        ],
                      ),
                    ),

                    Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.deepPurple.shade50,
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(
                        'assets/images/illustration-2.png',
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),

                    // ====================

                    Center(
                      child: Custom_Text(
                          text: 'تسجيل الهاتف',
                          size: 28,
                          color: ColorManager.b_69),
                    ),

                    Center(
                      child: Custom_Text(
                          text: 'أدخل رقم هاتفك المحمول للتفعيل',
                          size: 16,
                          color: ColorManager.b_69,
                          fontweight: FontWeight.w300),
                    ),
                    Center(
                      child: Custom_Text(
                          text: 'التحقق بخطوتين',
                          size: 16,
                          color: ColorManager.b_69,
                          fontweight: FontWeight.w300),
                    ),

                    // ====================

                    Container(
                      margin: const EdgeInsets.only(
                          left: 30.0, top: 30, right: 30.0),
                      // height: 40.0,
                      decoration: BoxDecoration(
                        // color: Colors.black,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(25.7)),

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
                        style: const TextStyle(
                            fontSize: 20.0, color: Colors.black),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: ColorManager.w_FA,
                          hintText: 'أدخل رقم الهاتف',
                          contentPadding:
                              const EdgeInsets.only(bottom: 25, top: 25),
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
                    ),

                    // ==============================

                    const SizedBox(height: 90),

                    InkWell(
                      onTap: () {
                        //

                        pop(context);
                      },
                      child: Custom_Button(h: 60, w: 300, text: 'Continue'),
                    ),
                    //
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
