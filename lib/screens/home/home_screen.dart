// ignore_for_file: avoid_print, unused_field, sized_box_for_whitespace, camel_case_types, must_be_immutable, non_constant_identifier_names, prefer_const_constructors_in_immutables, use_key_in_widget_constructors, unused_local_variable

import 'package:app7ads/components/components.dart';
import 'package:app7ads/screens/favourites/favourites_screen.dart';
import 'package:app7ads/screens/profile/profile_screen.dart';
import 'package:app7ads/widgets/card/card_adsense.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:getwidget/components/avatar/gf_avatar.dart';
import 'package:getwidget/components/button/gf_button_bar.dart';
import 'package:getwidget/components/card/gf_card.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';
import 'package:getwidget/position/gf_position.dart';
import 'package:motion_tab_bar/MotionBadgeWidget.dart';
import 'package:motion_tab_bar/MotionTabBar.dart';
import 'package:motion_tab_bar/MotionTabBarController.dart';
import 'package:provider/provider.dart';
import '../../constes/colormanager.dart';
import '../../controller/home_controller.dart';
import '../../widgets/custom_container.dart';
import '../../widgets/drop_down.dart';
import '../add_ads.dart';
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
    super.initState();
    _motionTabBarController = MotionTabBarController(
      initialIndex: 4,
      length: 5,
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
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      // appBar: AppBar(
      //   title: const Text(''),
      // ),
      bottomNavigationBar: Directionality(
        textDirection: TextDirection.ltr,
        child: BottomAppBar(
          elevation: 0,

          height: MediaQuery.of(context).size.height * 0.1,
          clipBehavior: Clip.none,
          shape: CircularNotchedRectangle(),
          notchMargin: 5.0,
          color: ColorManager.w_FA,

          child: Padding(
            padding: const EdgeInsets.only(top: 15),
            child: MotionTabBar(


              controller: _motionTabBarController, // Add this controller if you need to change your tab programmatically
              initialSelectedTab: "Home",
              useSafeArea: true, // default: true, apply safe area wrapper
              labels: const ["Dashboard","favourites", "Settings", "Profile", "Home"],
              icons: const [
                Icons.dashboard,
                Icons.favorite_border,
                Icons.settings,
                // Icons.settings,
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
              tabIconSelectedColor: ColorManager.w_FA,
              tabBarColor: ColorManager.w_FA,
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
          ContactUsScreen(controller: _motionTabBarController!) ,
          FavouritesScreen(controller: _motionTabBarController!) ,
          MainPageContentComponent(title: "settings Page", controller: _motionTabBarController!),
          MyProfile(),
          HomePage(controller: _motionTabBarController!),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: FloatingActionButton(
          elevation: 5,
          backgroundColor: ColorManager.b_69,
          onPressed: () {
navigateTo(context: context, widget: AddAds()) ;
          },
          child: const Padding(
            padding: EdgeInsets.only(
              top: 5,
              bottom: 5,
            ),
            child: Icon(Icons.add ,)
          ),
          // mini: true,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,


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
            color: ColorManager.w_color,
          ),
          child: Column(
            children: [
              //

              const Text('Go to "X" page programmatically'),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () => widget.controller.index = 0,
                child: const Text('Contact US Page'),
              ),
              ElevatedButton(
                onPressed: () => widget.controller.index = 1,
                child: const Text('Favourite Page'),
              ),
              ElevatedButton(
                onPressed: () => widget.controller.index = 2,
                child: const Text('Home Page'),
              ),
              ElevatedButton(
                onPressed: () => widget.controller.index = 2,
                child: const Text('Home Page'),
              ),
              ElevatedButton(
                onPressed: () => widget.controller.index = 3,
                child: const Text('Profile Page'),
              ),
              ElevatedButton(
                onPressed: () => widget.controller.index = 4,
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
                  width: size.width / 2,
                  height: 38,
                  alignment: Alignment.center,
                  child: TextField(
                    style: const TextStyle(fontSize: 13),
                    decoration: InputDecoration(
                      hintText: "البحث ...... ",
                      fillColor: ColorManager.w_FA,
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
                    //

                    Container(
                      height: size.height / 1.1,
                      width: double.maxFinite,
                      child: ListView.builder(
                        itemCount: 10,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(10),
                            child: card_Ads(
                              'https://hips.hearstapps.com/hmg-prod/images/2022-ford-e-transit-supervan-33-1655992304.jpg?crop=0.673xw:0.793xh;0.196xw,0.156xh&resize=980:*',
                              'Ford Pro Electric SuperVan',
                              'Ford says the Electric SuperVan can sprint to 60 mph',
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
