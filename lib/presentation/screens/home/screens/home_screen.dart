// ignore_for_file: avoid_print, unused_field, sized_box_for_whitespace, camel_case_types, must_be_immutable, non_constant_identifier_names, prefer_const_constructors_in_immutables, use_key_in_widget_constructors, unused_local_variable, use_build_context_synchronously, avoid_unnecessary_containers

import 'package:flutter/material.dart';

import 'package:motion_tab_bar/MotionBadgeWidget.dart';
import 'package:motion_tab_bar/MotionTabBar.dart';
import 'package:motion_tab_bar/MotionTabBarController.dart';
import 'package:provider/provider.dart';
import 'package:todotask/presentation/screens/favourites/screens/favourites_screen.dart';
import 'package:todotask/presentation/screens/home/widgets/home_body.dart';
import 'package:todotask/presentation/screens/profile/screens/profile_screen.dart';
import 'package:todotask/utils/constants/ColorManager.dart';

import '../../../../utils/controller/home_controller.dart';

import '../../adsense/screens/add_ads.dart';
import '../../contact_us/screens/contact_us.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> with TickerProviderStateMixin {
  // TabController? _tabController;
  MotionTabBarController? _motionTabBarController;

  @override
  void initState() {
    ints(context);
    super.initState();
    _motionTabBarController = MotionTabBarController(
      initialIndex: 4,
      length: 5,
      vsync: this,
    );
  }

  ints(context) async {
    final crlHome = Provider.of<Controller_Home>(context, listen: false);

    crlHome.items_JsonData(context);
    crlHome.city_JsonData(context);
  }

  @override
  void dispose() {
    super.dispose();
    _motionTabBarController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        bottomNavigationBar: Directionality(
          textDirection: TextDirection.ltr,
          child: BottomAppBar(
            elevation: 0,
            height: MediaQuery.of(context).size.height * 0.1,
            clipBehavior: Clip.none,
            shape: const CircularNotchedRectangle(),
            notchMargin: 5.0,
            color: ColorManager.primary,
            child: Padding(
              padding: const EdgeInsets.only(top: 15),
              child: MotionTabBar(
                controller:
                    _motionTabBarController, // Add this controller if you need to change your tab programmatically
                initialSelectedTab: "Home",
                useSafeArea: true, // default: true, apply safe area wrapper
                labels: const [
                  "Dashboard",
                  "favourites",
                  "Add-Ads",
                  "Profile",
                  "Home"
                ],
                icons: const [
                  Icons.dashboard,
                  Icons.favorite_border,
                  Icons.add,
                  Icons.person,
                  Icons.home,
                ],

                // optional badges, length must be same with labels
                badges: [
                  // Default Motion Badge Widget
                  const MotionBadgeWidget(
                    text: '10+',
                    textColor:
                        Colors.white, // optional, default to Colors.white
                    color: Colors.red, // optional, default to Colors.red
                    size: 18, // optional, default to 18
                  ),
                  const MotionBadgeWidget(
                    text: '7+',
                    textColor:
                        Colors.white, // optional, default to Colors.white
                    color: Colors.red, // optional, default to Colors.red
                    size: 18, // optional, default to 18
                  ),

                  // allow null
                  null,
                  // null,

                  // Default Motion Badge Widget with indicator only
                  const MotionBadgeWidget(
                    isIndicator: true,
                    color: Colors.red, // optional, default to Colors.red
                    size: 5, // optional, default to 5,
                    show: true, // true / false
                  ),
                  // custom badge Widget
                  Container(
                    color: Colors.black,
                    padding: const EdgeInsets.all(2),
                    child: const Text(
                      '48',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],

                tabSize: 50,
                tabBarHeight: 55,
                textStyle: const TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
                tabIconColor: Colors.white,
                tabIconSize: 28.0,
                tabIconSelectedSize: 26.0,
                tabSelectedColor: Colors.white,
                tabIconSelectedColor: ColorManager.primary,
                tabBarColor: ColorManager.primary,
                onTabItemSelected: (int value) {
                  setState(() {
                    _motionTabBarController!.index = value;
                  });
                },
              ),
            ),
          ),
        ),
        body: TabBarView(
          physics:
              const NeverScrollableScrollPhysics(), // swipe navigation handling is not supported
          controller: _motionTabBarController,
          children: [
            ContactUsScreen(controller: _motionTabBarController!),
            FavouritesScreen(controller: _motionTabBarController!),
            AddAds(controller: _motionTabBarController!),
            const MyProfile(),
            HomePage(controller: _motionTabBarController!),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
