// ignore_for_file: avoid_print, unused_local_variable, unused_field, unused_import, unused_element

import 'package:app_7/model/item_model.dart';
import 'package:app_7/presentation/screens/add/controller/add_controller.dart';
import 'package:app_7/presentation/screens/home/controller/cart.dart';
import 'package:app_7/presentation/screens/home/controller/home_controller.dart';
import 'package:app_7/presentation/screens/home/screens/ads_screen.dart';
import 'package:app_7/presentation/screens/home/screens/notifications_screen.dart';
import 'package:app_7/presentation/screens/home/widgets/drop_down.dart';
import 'package:app_7/presentation/screens/home/widgets/search_container.dart';
import 'package:app_7/presentation/widgets/images/display_image_widget.dart';
import 'package:app_7/core/constants/navigators.dart';
import 'package:app_7/presentation/widgets/sliders/auto_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:motion_tab_bar/MotionTabBarController.dart';
import 'package:provider/provider.dart';
import '../../../../core/constants/ColorManager.dart';
import '../widgets/button_notifications.dart';
import '../widgets/item_card.dart';
import '../../../widgets/img_network.dart';

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
    final proCart = Provider.of<Cart_Controller>(context, listen: false);

    if (proCart.List_Values_Ads.isEmpty) {
      proCart.get_Values_Ads_Stream();
    }
  }

  List<Item> d = [];

  List<String> List_img = [
    'https://www.rowadalaamal.com/wp-content/uploads/2020/09/web-in3-24.jpg',
    'https://www.rowadalaamal.com/wp-content/uploads/2020/09/web-in3-24.jpg',
    'https://www.rowadalaamal.com/wp-content/uploads/2020/09/web-in3-24.jpg',
    'https://www.rowadalaamal.com/wp-content/uploads/2020/09/web-in3-24.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
        child: Scaffold(
      backgroundColor: ColorManager.w_color,
      body: Consumer3<Controller_Home, Cart_Controller, Add_Controller>(
          builder: (BuildContext context, proHome, proCart, proADD, Widget? child) {
        //
        return CustomScrollView(
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
                Button_Notifications(true, 5, () {
                  pushNewScreen(context, const Notifications_Screen());
                }),
              ],

              // البحث =============================================================

              expandedHeight: 160,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                titlePadding: const EdgeInsets.symmetric(vertical: 8),
                title: const SearchContainer(),
                background:
                    Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children: [
                  // الأقسام المدينة =============================================

                  SizedBox(
                    width: size.width / 1.3,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Drop_Down_City(
                          w: size.width / 3,
                          title: "المدينة",
                          selectedValueCity: proHome.selectedValue_City ?? '',
                          cityItems: proHome.data_City_json,
                          onChanged: (value) {
                            //

                            setState(() {
                              proHome.selectedValue_City = value;
                            });
                          },
                        ),

                        //

                        Drop_Down_Items(
                          w: size.width / 3,
                          title: 'الأقسام',
                          selectedValue: proHome.selectedValue ?? '',
                          genderItems: proHome.data_Items_json,
                          onChanged: (value) {
                            //

                            setState(() {
                              proHome.selectedValue = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),
                ]),
              ),
            ),
            proCart.List_Values_Ads.isEmpty
                ? const SliverFillRemaining(
                    child: Center(
                      child: SizedBox(
                        width: 25,
                        height: 25,
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  )
                : SliverList(
                    delegate: SliverChildBuilderDelegate(
                      childCount: proCart.List_Values_Ads.length + ((proCart.List_Values_Ads.length - 1) ~/ 4),
                      (BuildContext context, int index) {
                        final actualIndex = index - (index ~/ 4);
                        if (actualIndex < 0 || actualIndex >= proCart.List_Values_Ads.length) {
                          return const SizedBox();
                        }

                        String actionFavourier = proCart.List_Values_Ads[actualIndex]['action_favourier'] ?? 'false';

                        if (index % 5 == 4) {
                          return Auto_Slider(context, imageList: List_img);
                        }

                        return InkWell(
                          onTap: () {
                            //

                            proCart.update_num_Views(
                              proCart.List_Values_Ads[actualIndex]['id'],
                              proCart.List_Values_Ads[actualIndex]['num_views'],
                            );

                            pushNewScreen(
                                context,
                                Ads_Screen(
                                  list_favourites: proCart.List_Values_Ads[actualIndex],
                                  id: proCart.List_Values_Ads[actualIndex]['id'],
                                  imageUrls: proCart.List_Values_Ads[actualIndex]['imageUrls'],
                                  selectedValue_City: proCart.List_Values_Ads[actualIndex]['selectedValue_City'] ?? "",
                                  location: proCart.List_Values_Ads[actualIndex]['location'] ?? "",
                                  selectItems: proCart.List_Values_Ads[actualIndex]['selectItems'] ?? "",
                                  price: proCart.List_Values_Ads[actualIndex]['price'] ?? "",
                                  date: proCart.List_Values_Ads[actualIndex]['date'] ?? "",
                                  select_Status: proCart.List_Values_Ads[actualIndex]['select_Status'] ?? "",
                                  select_Payment: proCart.List_Values_Ads[actualIndex]['select_Payment'] ?? "",
                                  brand: proCart.List_Values_Ads[actualIndex]['Brand'] ?? "",
                                  model: proCart.List_Values_Ads[actualIndex]['model'] ?? "",
                                  description: proCart.List_Values_Ads[actualIndex]['description'] ?? "",
                                  note: proCart.List_Values_Ads[actualIndex]['note'] ?? "",
                                  num_views: proCart.List_Values_Ads[actualIndex]['num_views'] ?? "",
                                  action_favourier: proCart.List_Values_Ads[actualIndex]['action_favourier'],
                                ));
                          },
                          child: ItemCard(
                            context,
                            onPressed: () async {
                              setState(() {
                                final isFavourited = proCart.List_Values_Ads[actualIndex]['action_favourier'] == 'true';
                                proCart.List_Values_Ads[actualIndex]['action_favourier'] = isFavourited ? 'false' : 'true';

                                if (isFavourited) {
                                  proCart.list_favourites
                                      .removeWhere((item) => item["location"] == proCart.List_Values_Ads[actualIndex]['location']);
                                } else {
                                  proCart.list_favourites.add(proCart.List_Values_Ads[actualIndex]);
                                }
                              });

                              proCart.updateNumber(proCart.list_favourites.length);
                              proCart.update_Favourites(proCart.List_Values_Ads[actualIndex]['id'],
                                  proCart.List_Values_Ads[actualIndex]['action_favourier']);
                            },
                            imageUrls: (proCart.List_Values_Ads.isNotEmpty &&
                                    actualIndex < proCart.List_Values_Ads.length &&
                                    proCart.List_Values_Ads[actualIndex]['imageUrls'] is List &&
                                    (proCart.List_Values_Ads[actualIndex]['imageUrls'] as List).isNotEmpty)
                                ? proCart.List_Values_Ads[actualIndex]['imageUrls'][0]
                                : "",
                            price: proCart.List_Values_Ads[actualIndex]['price'] ?? "",
                            // location: proCart.List_Values_Ads[actualIndex]['location'] ?? "",
                            description: proCart.List_Values_Ads[actualIndex]['description'] ?? "",
                            action_color: actionFavourier == 'true' ? Colors.red : Colors.grey,
                            date: proCart.List_Values_Ads[actualIndex]['date'] ?? "",
                            city: proCart.List_Values_Ads[actualIndex]['selectedValue_City'] ?? "",
                            select_Items: proCart.List_Values_Ads[actualIndex]['selectItems'] ?? "",
                            num_views: proCart.List_Values_Ads[actualIndex]['num_views'] ?? "",
                          ),
                        );
                      },
                    ),
                  )
          ],
        );
      }),
    ));
  }
}
