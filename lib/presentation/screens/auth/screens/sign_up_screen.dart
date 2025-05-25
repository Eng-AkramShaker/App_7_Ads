// ignore_for_file: avoid_unnecessary_containers, file_names, use_build_context_synchronously

import 'package:app_7/core/constants/ColorManager.dart';
import 'package:app_7/core/constants/app_sizes.dart';
import 'package:app_7/core/constants/navigators.dart';
import 'package:app_7/presentation/screens/auth/controller/auth_controller.dart';
import 'package:app_7/presentation/screens/auth/screens/sign_In_screen.dart';
import 'package:app_7/presentation/widgets/text_field/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> formKey_Sign_up = GlobalKey<FormState>();

  bool secure = false;
  bool secure2 = false;
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<Auth_Controller>(builder: (context, proAuth, child) {
      return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
            title: Center(child: Text("أنشاء حساب")),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                pop(context);
              },
            ),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  flex: 1,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: .05 * height_media(context)),
                        Text(
                          " تسجيل حساب جديد",
                          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
                        ),
                        Text(
                          "نطمح أن تكون مجموعتنا الخيار الأول للمشترين عبر الإنترنت",
                          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
                        ),
                      ],
                    ),
                  )),
              SizedBox(height: .03 * height_media(context)),
              Expanded(
                  flex: 4,
                  child: Form(
                    key: formKey_Sign_up,
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              CustomTextField(
                                hint: 'أسم المستخدم *',
                                secure: false,
                                icon: Icons.person,
                                controlller: proAuth.username,
                                validator: proAuth.validateUsername,
                              ),
                              const SizedBox(height: 20),
                              CustomTextField(
                                hint: 'الأيميل *',
                                secure: false,
                                icon: Icons.email,
                                controlller: proAuth.email,
                                validator: proAuth.validateEmail,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              CustomTextField(
                                hint: 'الباسورد *',
                                secure: secure,
                                icon: secure ? Icons.lock : Icons.lock_open_rounded,
                                onTap: () {
                                  setState(() {
                                    secure = !secure;
                                  });
                                },
                                controlller: proAuth.password,
                                validator: proAuth.validatePassword,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              CustomTextField(
                                hint: 'تأكيد الباسورد *',
                                secure: secure2,
                                icon: secure2 ? Icons.lock : Icons.lock_open_rounded,
                                onTap: () {
                                  setState(() {
                                    secure2 = !secure2;
                                  });
                                },
                                controlller: proAuth.C_password,
                                validator: proAuth.validateConfirmPassword,
                              ),
                              Row(
                                children: [
                                  Transform.scale(
                                    scale: 0.8,
                                    child: Checkbox(
                                        activeColor: ColorManager.primary,
                                        value: value,
                                        onChanged: (val) {
                                          setState(() {
                                            value = val!;
                                          });
                                        }),
                                  ),
                                  Text(
                                    "عند تسجيلك فإنك توافق على شروط سهيل.",
                                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )),
              Expanded(
                  flex: 2,
                  child: Container(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Center(
                            child: MaterialButton(
                              minWidth: .9 * width_media(context),
                              elevation: 0,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                              height: 40,
                              color: ColorManager.primary,
                              onPressed: () async {
                                //

                                proAuth.Sign_up(
                                  context,
                                  proAuth.username.text,
                                  proAuth.email.text,
                                  proAuth.password.text,
                                  proAuth.C_password.text,
                                  formKey_Sign_up,
                                ).then((onValue) {
                                  if (proAuth.user != null) {
                                    pushNewScreen(context, Sign_in_Screen());
                                  }
                                });
                              },
                              child:
                                  Text("أنشاء حساب", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white)),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "هل لديك حساب بالفعل؟",
                                  style: TextStyle(color: Colors.grey),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    // pushNewScreen(context, SignUpScreen());
                                  },
                                  child: const Text(
                                    "تسجيل دخول ",
                                    style: TextStyle(
                                        color: ColorManager.primary,
                                        decoration: TextDecoration.underline,
                                        decorationColor: ColorManager.primary),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
            ],
          ),
        ),
      );
    });
  }
}
