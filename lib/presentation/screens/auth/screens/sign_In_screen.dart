// ignore_for_file: unused_element, avoid_print, use_build_context_synchronously, camel_case_types, file_names

import 'package:app_7/core/constants/ColorManager.dart';
import 'package:app_7/core/constants/app_sizes.dart';
import 'package:app_7/core/constants/navigators.dart';
import 'package:app_7/presentation/screens/auth/controller/auth_controller.dart';
import 'package:app_7/presentation/screens/auth/screens/forgot_password_screen.dart';
import 'package:app_7/presentation/screens/auth/screens/sign_up_screen.dart';
import 'package:app_7/presentation/widgets/custom_tex2.dart';
import 'package:app_7/presentation/widgets/text_field/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Sign_in_Screen extends StatefulWidget {
  const Sign_in_Screen({super.key});

  @override
  State<Sign_in_Screen> createState() => _Sign_in_ScreenState();
}

class _Sign_in_ScreenState extends State<Sign_in_Screen> with SingleTickerProviderStateMixin {
  final GlobalKey<FormState> formKey_Sign_in = GlobalKey<FormState>();

  bool secure = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Consumer<Auth_Controller>(builder: (context, proAuth, child) {
      return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: proAuth.isLoding
              ? Center(
                  child: CircularProgressIndicator(color: ColorManager.primary),
                )
              : Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: width_media(context),
                          height: 300,
                          decoration: BoxDecoration(
                            color: theme.brightness == Brightness.light ? const Color(0xffF5F5F5) : Colors.black,
                            image: const DecorationImage(
                              image: AssetImage("assets/images/logo.png"),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Container(
                        width: width_media(context),
                        height: height_media(context),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: const BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              // Navigator.pushReplacementNamed(context, signup);
                            },
                            child: Column(
                              children: [
                                Form(
                                  key: formKey_Sign_in,
                                  canPop: true,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: CustomText(
                                          text: 'مرحبا بك في بكناري',
                                          color: ColorManager.primary,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17,
                                        ),
                                      ),

                                      CustomText(
                                        text: "أدخل حسابك لتسجيل الدخول الي كناري ",
                                        color: ColorManager.primary,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17,
                                      ),

                                      SizedBox(height: .06 * height_media(context)),

                                      CustomTextField(
                                        controlller: proAuth.email,
                                        hint: 'الأيميل *',
                                        secure: false,
                                        icon: Icons.person,
                                        validator: proAuth.validateEmail,
                                      ),
                                      SizedBox(height: .02 * height_media(context)),
                                      CustomTextField(
                                        hint: 'الباسورد *',
                                        controlller: proAuth.password,
                                        secure: secure,
                                        icon: secure ? Icons.lock : Icons.lock_open_rounded,
                                        onTap: () {
                                          setState(() {
                                            secure = !secure;
                                          });
                                        },
                                        validator: proAuth.validatePassword,
                                      ),
                                      SizedBox(height: .03 * height_media(context)),
                                      GestureDetector(
                                        onTap: () {
                                          pushNewScreen(context, ForgotPasswordScreen());
                                        },
                                        child: Align(
                                          alignment: Alignment.bottomRight,
                                          child: Text(
                                            "اذا نسيت كلمه المرور . ",
                                            style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w400,
                                                color: theme.brightness == Brightness.light ? Colors.grey : Colors.white),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: .03 * height_media(context)),

                                      MaterialButton(
                                        minWidth: .9 * width_media(context),
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                        height: 40,
                                        color: theme.brightness == Brightness.light ? ColorManager.primary : ColorManager.yalwColor,
                                        onPressed: () async {
                                          //

                                          await proAuth.Sign_In(context, proAuth.email.text, proAuth.password.text, formKey_Sign_in);
                                        },
                                        child: Text("تسجيل الدخول",
                                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white)),
                                      ),
                                      //
                                    ],
                                  ),
                                ),

                                //

                                SizedBox(height: .06 * height_media(context)),

                                GestureDetector(
                                  onTap: () {
                                    // Navigator.pushReplacementNamed(context, login);

                                    pushNewScreen(context, SignUpScreen());
                                  },
                                  child: const Text(
                                    "أو قم بإنشاء حساب جديد",
                                    style: TextStyle(
                                        color: ColorManager.primary,
                                        decoration: TextDecoration.underline,
                                        decorationColor: ColorManager.primary),
                                  ),
                                ),

                                const SizedBox(height: 20),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      ' سياسة و شروط الإستخدام',
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400,
                                        decoration: TextDecoration.underline,
                                        color: theme.brightness == Brightness.light ? Colors.black : Colors.white,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'عند المتابعة، يعني موافقتك علي ',
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400,
                                        color: theme.brightness == Brightness.light ? Colors.black : Colors.white,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      );
    });
  }
}
