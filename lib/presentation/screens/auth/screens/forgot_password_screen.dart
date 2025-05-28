import 'package:app_7/core/constants/ColorManager.dart';
import 'package:app_7/core/constants/app_sizes.dart';
import 'package:app_7/presentation/screens/auth/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Consumer<Auth_Controller>(builder: (context, proAuth, child) {
      return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(title: const Text('هل نسيت كلمة المرور؟')),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: proAuth.isLoding
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
                      Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const Text(
                              'أدخل بريدك الإلكتروني وسنرسل لك رابطًا لإعادة تعيين كلمة المرور.',
                              style: TextStyle(fontSize: 16),
                            ),
                            const SizedBox(height: 50),
                            TextFormField(
                              controller: proAuth.email,
                              decoration: const InputDecoration(
                                labelText: 'البريد الإلكتروني',
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'يرجى إدخال البريد الإلكتروني';
                                }
                                if (!value.contains('@')) {
                                  return 'يرجى إدخال بريد إلكتروني صالح';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 80),
                            MaterialButton(
                              minWidth: .9 * width_media(context),
                              elevation: 0,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                              height: 40,
                              color: theme.brightness == Brightness.light ? ColorManager.primary : ColorManager.yalwColor,
                              onPressed: () async {
                                //

                                if (formKey.currentState!.validate()) {
                                  await proAuth.sendPasswordResetEmail(context, proAuth.email.text.trim());
                                }
                              },
                              child: Text('إرسال رابط إعادة التعيين',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      );
    });
  }
}
