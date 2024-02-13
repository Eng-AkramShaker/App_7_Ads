// ignore_for_file: avoid_print, unused_field, sized_box_for_whitespace, camel_case_types, must_be_immutable, non_constant_identifier_names, prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:app7ads/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:motion_tab_bar/MotionBadgeWidget.dart';
import 'package:motion_tab_bar/MotionTabBar.dart';
import 'package:motion_tab_bar/MotionTabBarController.dart';
import 'package:provider/provider.dart';
import '../../constes/colormanager.dart';
import '../../controller/home_controller.dart';
import '../../widgets/custom_container.dart';
import '../../widgets/drop_down.dart';

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
    super.initState();
    _motionTabBarController = MotionTabBarController(
      initialIndex: 3,
      length: 4,
      vsync: this,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _motionTabBarController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text(''),
      // ),
      bottomNavigationBar: Directionality(
        textDirection: TextDirection.ltr,
        child: MotionTabBar(
          controller: _motionTabBarController, // Add this controller if you need to change your tab programmatically
          initialSelectedTab: "Home",
          useSafeArea: true, // default: true, apply safe area wrapper
          labels: const ["Dashboard", "Settings", "Profile", "Home"],
          icons: const [
            Icons.dashboard,
            Icons.settings,
            Icons.people_alt,
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

            // allow null
            null,

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
          tabIconSelectedColor: Colors.white,
          tabBarColor: Colors.white,
          onTabItemSelected: (int value) {
            setState(() {
              _motionTabBarController!.index = value;
            });
          },
        ),
      ),
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(), // swipe navigation handling is not supported
        controller: _motionTabBarController,
        children: [
          MainPageContentComponent(title: "Dashboard Page", controller: _motionTabBarController!),
          MainPageContentComponent(title: "Profile Page", controller: _motionTabBarController!),
          MyProfile(),
          HomePage(controller: _motionTabBarController!),
        ],
      ),
    );
  }
}

class MainPageContentComponent extends StatefulWidget {
  const MainPageContentComponent({
    required this.title,
    required this.controller,
    Key? key,
  }) : super(key: key);

  final String title;
  final MotionTabBarController controller;

  @override
  State<MainPageContentComponent> createState() => _MainPageContentComponentState();
}

class _MainPageContentComponentState extends State<MainPageContentComponent> {
  late TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController(text: 'initial text');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: ColorManager.w_F8,
          ),
          child: Column(
            children: [
              //

              const Text('Go to "X" page programmatically'),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () => widget.controller.index = 0,
                child: const Text('Dashboard Page'),
              ),
              ElevatedButton(
                onPressed: () => widget.controller.index = 1,
                child: const Text('Home Page'),
              ),
              ElevatedButton(
                onPressed: () => widget.controller.index = 2,
                child: const Text('Profile Page'),
              ),
              ElevatedButton(
                onPressed: () => widget.controller.index = 3,
                child: const Text('Settings Page'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Home Page =====================================================

class HomePage extends StatefulWidget {
  HomePage({required this.controller, Key? key}) : super(key: key);

  final MotionTabBarController controller;

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  String? selectedValue;

  //

  @override
  void initState() {
    super.initState();
    ints(context);
  }

  ints(context) {
    final crlHome = Provider.of<Controller_Home>(context, listen: false);

    Future.delayed(const Duration(seconds: 0), () async {
      setState(() {
        crlHome.city_JsonData(context);
        crlHome.items_JsonData(context);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final crlHome = Provider.of<Controller_Home>(context, listen: false);

    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorManager.w_FA,
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
                            child: custom_Container(h: 40, w: 40.0, icon: Icons.notifications_active),
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
                  width: 250,
                  height: 40,
                  alignment: Alignment.center,
                  child: TextField(
                    style: const TextStyle(fontSize: 13),
                    decoration: InputDecoration(
                      hintText: "البحث ...... ",
                      fillColor: Colors.white,
                      filled: true,
                      suffixIcon: const Icon(Icons.search),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: const BorderSide(color: Colors.transparent),
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                    ),
                  ),
                ),
                background:
                    Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children: [
                  // الأقسام المحافظه=============================================================
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Drop_Down(
                        selectedValue: selectedValue,
                        title: 'أسم المحافظة',
                        genderItems: crlHome.data_City_json,
                      ),
                      Drop_Down(
                        selectedValue: selectedValue,
                        title: 'الأقسام',
                        genderItems: crlHome.data_Items_json,
                      ),
                    ],
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
                    Container(
                      height: 300,
                      width: double.maxFinite,
                      child: ListView.builder(
                        itemCount: 5,
                        itemBuilder: (BuildContext context, int index) {
                          return const Card(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('uuuuu'),
                              ],
                            ),
                          );
                        },
                      ),
                    )
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
