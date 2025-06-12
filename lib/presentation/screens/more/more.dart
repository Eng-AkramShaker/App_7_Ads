// ignore_for_file: unused_field

import 'package:app_7/core/constants/navigators.dart';
import 'package:app_7/presentation/screens/auth/controller/auth_controller.dart';
import 'package:app_7/presentation/screens/home/controller/home_controller.dart';
import 'package:app_7/presentation/screens/more/about_us/about_us.dart';
import 'package:app_7/presentation/screens/more/contact%20us/contact_us.dart';
import 'package:app_7/presentation/screens/more/privacy_policy/privacy_policy_screen.dart';
import 'package:app_7/presentation/screens/more/profile/screens/profile_screen.dart';
import 'package:app_7/presentation/screens/more/terms_conditions/terms_conditions_screen.dart';
import 'package:app_7/presentation/screens/more/terms_use/terms_use_screen.dart';
import 'package:flutter/material.dart';
import 'package:motion_tab_bar/MotionTabBarController.dart';
import 'package:app_7/core/constants/ColorManager.dart';
import 'package:provider/provider.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({super.key, required this.controller});
  final MotionTabBarController controller;

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer2<Auth_Controller, Controller_Home>(builder: (context, proAuth, proHome, child) {
      return Directionality(
        textDirection: TextDirection.rtl,
        child: SizedBox(
          width: size.width / 2,
          child: Scaffold(
            backgroundColor: Colors.white,
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Material(
                  color: ColorManager.primary,
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).padding.top,
                        bottom: 24,
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 30),
                          CircleAvatar(
                            radius: 50.0,
                            backgroundImage: NetworkImage(
                                proAuth.user!.imageUrl ?? 'https://sisd.gujaratuniversity.ac.in/assets/images/student.jpg'),
                          ),
                          SizedBox(height: 12),
                          Text(
                            ' مرحبااا. 👋',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                          ),
                          Text(
                            proAuth.user!.username.toString(),
                            style: TextStyle(fontSize: 22, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    SizedBox(height: 20),

                    ListTile(
                      leading: Icon(Icons.home, color: ColorManager.primary),
                      title: Text('الرئيسية', style: TextStyle(color: ColorManager.primary)),
                      onTap: () {
                        setState(() {
                          proHome.motionTabBarController!.index = 3;
                        });
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.person, color: ColorManager.primary),
                      title: Text('حسابي', style: TextStyle(color: ColorManager.primary)),
                      onTap: () {
                        pushNewScreen(context, MyProfile());
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.contact_mail, color: ColorManager.primary),
                      title: Text('تواصل معنا', style: TextStyle(color: ColorManager.primary)),
                      onTap: () {
                        pushNewScreen(context, Contact_Us_Screen());
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.info, color: ColorManager.primary),
                      title: Text('من نحن', style: TextStyle(color: ColorManager.primary)),
                      onTap: () {
                        pushNewScreen(context, About_Us_Screen());
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.privacy_tip, color: ColorManager.primary),
                      title: Text('سياسة الخصوصية', style: TextStyle(color: ColorManager.primary)),
                      onTap: () {
                        pushNewScreen(context, Privacy_Policy_Screen());
                      },
                    ),

                    ListTile(
                      leading: Icon(Icons.article, color: ColorManager.primary),
                      title: Text('الشروط والأحكام', style: TextStyle(color: ColorManager.primary)),
                      onTap: () {
                        pushNewScreen(context, Terms_Conditions_Screen());
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.file_copy_sharp, color: ColorManager.primary),
                      title: Text('شروط الأستخدام', style: TextStyle(color: ColorManager.primary)),
                      onTap: () {
                        pushNewScreen(context, terms_useScreen());
                      },
                    ),

                    // Create Account or Logout
                    proAuth.user!.uid.isEmpty
                        ? ListTile(
                            leading: Icon(Icons.logout, color: ColorManager.primary),
                            title: Text(
                              'انشاء حساب',
                              style: TextStyle(
                                color: ColorManager.primary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onTap: () {
                              // pushAndRemoveUntil(context, SingUp_Screen());
                            },
                          )
                        : ListTile(
                            leading: Icon(Icons.logout, color: ColorManager.redColor),
                            title: Text(
                              'تسجيل الخروج',
                              style: TextStyle(
                                color: ColorManager.redColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onTap: () async {
                              proAuth.signOut(context);
                              //  pushAndRemoveUntil(context, SignIn_Screen());
                            },
                          ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
