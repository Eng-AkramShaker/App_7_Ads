// ignore_for_file: avoid_print, unused_field, sized_box_for_whitespace, camel_case_types, must_be_immutable, non_constant_identifier_names, prefer_const_constructors_in_immutables, use_key_in_widget_constructors, unused_local_variable, use_build_context_synchronously, avoid_unnecessary_containers

import 'package:app_7/presentation/screens/favourites/screens/favourites_screen.dart';
import 'package:app_7/presentation/screens/profile/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:motion_tab_bar/MotionBadgeWidget.dart';
import 'package:motion_tab_bar/MotionTabBar.dart';
import 'package:motion_tab_bar/MotionTabBarController.dart';

import 'package:provider/provider.dart';
import 'package:app_7/core/constants/ColorManager.dart';

import '../controller/cart.dart';
import '../controller/home_controller.dart';
import '../../add/screens/add_ads.dart';
import '../../contact_us/screens/contact_us.dart';
import 'home_body.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> with TickerProviderStateMixin {
  TabController? _tabController;
  Controller_Home crlHome = Controller_Home();

  @override
  void initState() {
    ints(context);
    super.initState();
    crlHome.motionTabBarController = MotionTabBarController(initialIndex: 4, length: 5, vsync: this);
  }

  ints(context) async {
    crlHome = Provider.of<Controller_Home>(context, listen: false);

    crlHome.items_JsonData(context);
    crlHome.city_JsonData(context);
    crlHome.Status_JsonData(context);
    crlHome.Payment_JsonData(context);
  }

  @override
  void dispose() {
    super.dispose();
    crlHome.motionTabBarController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // final crl = Provider.of<Cart_Controller>(context, listen: false);

    return Scaffold(
      bottomNavigationBar: MotionTabBar(
        controller: crlHome.motionTabBarController,
        initialSelectedTab: "الرئيسية",
        useSafeArea: true,
        labels: const ["تواصل معنا", "المفضلة", "اضافه اعلان", "حسابي", "الرئيسية"],
        icons: const [Icons.chat, Icons.favorite_border, Icons.add, Icons.person, Icons.home],
        badges: [
          // Default Motion Badge Widget

          null,
          // MotionBadgeWidget(
          //   text: '10+',
          //   textColor: Colors.white, // optional, default to Colors.white
          //   color: Colors.red, // optional, default to Colors.red
          //   size: 18, // optional, default to 18
          // ),
          Consumer<Cart_Controller>(builder: (BuildContext context, provider, Widget? child) {
            //
            return MotionBadgeWidget(
              text: '${provider.myNumber}',
              textColor: Colors.white, // optional, default to Colors.white
              color: Colors.red, // optional, default to Colors.red
              size: 20, // optional, default to 18
            );
          }),

          // allow null
          null,
          // null,

          // Default Motion Badge Widget with indicator only
          // MotionBadgeWidget(
          //   isIndicator: true,
          //   color: Colors.red, // optional, default to Colors.red
          //   size: 5, // optional, default to 5,
          //   show: true, // true / false
          // ),
          null,
          null,
          // custom badge Widget
          // Container(
          //   color: Colors.black,
          //   padding: const EdgeInsets.all(2),
          //   child: const Text(
          //     '48',
          //     style: TextStyle(
          //       fontSize: 14,
          //       color: Colors.white,
          //     ),
          //   ),
          // ),
        ],
        tabSize: 50,
        tabBarHeight: 60,
        textStyle: const TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.w500),
        tabIconColor: Colors.white,
        tabIconSize: 28.0,
        tabIconSelectedSize: 26.0,
        tabSelectedColor: Colors.white,
        tabIconSelectedColor: ColorManager.primary,
        tabBarColor: ColorManager.primary,
        onTabItemSelected: (int value) {
          setState(() {
            crlHome.motionTabBarController!.index = value;
          });
        },
      ),
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(), // swipe navigation handling is not supported
        controller: crlHome.motionTabBarController,
        children: [
          ContactUsScreen(controller: crlHome.motionTabBarController!),
          FavouritesScreen(controller: crlHome.motionTabBarController!),
          AddAds(controller: crlHome.motionTabBarController!),
          MyProfile(controller: crlHome.motionTabBarController!),
          HomePage(controller: crlHome.motionTabBarController!),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
