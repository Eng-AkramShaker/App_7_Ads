// ignore_for_file: avoid_print, unused_field, sized_box_for_whitespace, camel_case_types, must_be_immutable, non_constant_identifier_names, prefer_const_constructors_in_immutables, use_key_in_widget_constructors, unused_local_variable, use_build_context_synchronously, avoid_unnecessary_containers

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:motion_tab_bar/MotionBadgeWidget.dart';
import 'package:motion_tab_bar/MotionTabBar.dart';
import 'package:motion_tab_bar/MotionTabBarController.dart';
import 'package:provider/provider.dart';
import 'package:todotask/screens/favourites/favourites_screen.dart';
import 'package:todotask/screens/profile/profile_screen.dart';
import '../../constes/colormanager.dart';
import '../../controller/home_controller.dart';
import '../../widgets/custom_container.dart';
import '../../widgets/drop_down.dart';
import '../adsense/add_ads.dart';
import '../contact_us/contact_us.dart';

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
        // appBar: AppBar(
        //   title: const Text(''),
        // ),
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
                controller: _motionTabBarController, // Add this controller if you need to change your tab programmatically
                initialSelectedTab: "Home",
                useSafeArea: true, // default: true, apply safe area wrapper
                labels: const ["Dashboard", "favourites", "Add-Ads", "Profile", "Home"],
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
                    textColor: Colors.white, // optional, default to Colors.white
                    color: Colors.red, // optional, default to Colors.red
                    size: 18, // optional, default to 18
                  ),
                  const MotionBadgeWidget(
                    text: '7+',
                    textColor: Colors.white, // optional, default to Colors.white
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
                tabIconColor: Colors.blue[600],
                tabIconSize: 28.0,
                tabIconSelectedSize: 26.0,
                tabSelectedColor: Colors.blue[900],
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
          physics: const NeverScrollableScrollPhysics(), // swipe navigation handling is not supported
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

// Home Page =====================================================

class HomePage extends StatefulWidget {
  HomePage({required this.controller, super.key});

  final MotionTabBarController controller;

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
//
  @override
  void initState() {
    ints(context);

    super.initState();
  }

  ints(context) async {
    final crlHome = Provider.of<Controller_Home>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    final crlHome = Provider.of<Controller_Home>(context, listen: false);
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorManager.w_color,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              primary: true,
              pinned: true,
              backgroundColor: ColorManager.b_69,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30.0),
                  bottomRight: Radius.circular(30.0),
                ),
              ),
              // leading: _leadingButton(context),
              actions: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Align(
                          child: InkWell(
                            onTap: () {
                              //
                              // Get.back();
                            },
                            child: custom_Container(
                              h: 40,
                              w: 40.0,
                              icon: Icons.notifications_active,
                              color_icon: ColorManager.w_color,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],

              // البحث =============================================================

              expandedHeight: 200,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                titlePadding: const EdgeInsets.symmetric(vertical: 8),
                title: Container(
                  width: size.width / 2,
                  height: 35,
                  alignment: Alignment.center,
                  child: TextField(
                    style: const TextStyle(fontSize: 13),
                    decoration: InputDecoration(
                      hintText: " البحث ..... ",
                      fillColor: ColorManager.w_color,
                      filled: true,
                      suffixIcon: const Icon(
                        Icons.search,
                        size: 15,
                        color: ColorManager.primary,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7),
                        borderSide: const BorderSide(
                          color: ColorManager.primary,
                        ),
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                    ),
                  ),
                ),
                background:
                    Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children: [
                  //
                  // الأقسام المحافظه=============================================================

                  Container(
                    width: size.width / 1.3,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Drop_Down_City(
                          title: 'أسم المحافظة',
                          genderItems: crlHome.data_City_json,
                        ),
                        Drop_Down_Items(
                          title: 'الأقسام',
                          genderItems: crlHome.data_Items_json,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20)
                ]),
              ),
            ),
            SliverFillRemaining(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //
                    const SizedBox(height: 20),
                    Container(
                      height: size.height / 1.1,
                      width: size.width / 1.04,
                      child: ListView.builder(
                        itemCount: 10,
                        itemBuilder: (BuildContext context, int index) {
                          return const Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Row(
                              children: [],
                            ),
                          );
                        },
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                        Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.red,
                            ),
                          ),
                        ),
                        //SizedBox
                      ]), //Row
                    ),
                    const Row(
                      children: [
                        Image(
                          height: 120,
                          width: 120,
                          // fit: BoxFit.cover,
                          image: NetworkImage(
                              "https://contactcars.fra1.cdn.digitaloceanspaces.com/contactcars-production/Images/Large/UsedCars/org_e294958d-2d6f-4985-9918-f2cbd848ee89.jpeg"),
                        ),
                      ],
                    ),
                    Center(
                      child: Column(
                        children: [
                          Container(
                            color: Colors.red,
                            height: 100,
                            margin: const EdgeInsets.all(20),
                            child: Expanded(
                              child: Table(
                                defaultColumnWidth: const FixedColumnWidth(120.0),
                                border: TableBorder.all(color: Colors.black, style: BorderStyle.solid, width: 2),
                                children: [
                                  TableRow(children: [
                                    Column(
                                      children: [
                                        Container(
                                          // height: size.height,
                                          child: const Text('Website', style: TextStyle(fontSize: 20.0)),
                                        ),
                                      ],
                                    ),
                                    const Column(children: [Text('Tutorial', style: TextStyle(fontSize: 20.0))]),
                                    const Column(children: [Text('Review', style: TextStyle(fontSize: 20.0))]),
                                  ]),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
