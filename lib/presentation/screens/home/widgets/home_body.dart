import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:motion_tab_bar/MotionTabBarController.dart';
import 'package:provider/provider.dart';
import 'package:todotask/presentation/screens/home/widgets/custom_container.dart';
import 'package:todotask/presentation/screens/home/widgets/drop_down.dart';
import 'package:todotask/presentation/screens/home/widgets/search_container.dart';
import 'package:todotask/presentation/widgets/item_card.dart';

import 'package:todotask/utils/controller/home_controller.dart';

import '../../../../utils/constants/ColorManager.dart';

class HomePage extends StatefulWidget {
  const HomePage({required this.controller, super.key});

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
    // final crlHome = Provider.of<Controller_Home>(context, listen: false);
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
                title: const SearchContainer(),
                background: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //
                      // الأقسام المحافظه=============================================================

                      SizedBox(
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
              child: Container(
                margin: const EdgeInsets.only(top: 20, left: 5, right: 1),
                width: 500,
                height: 200,
                child: ListView.builder(
                    itemCount: 1,
                    itemBuilder: (BuildContext context, int index) {
                      return const ItemCard();
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
