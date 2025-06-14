// ignore_for_file: use_build_context_synchronously

import 'package:app_7/core/constants/show_messages.dart';
import 'package:app_7/presentation/screens/add/controller/add_controller.dart';
import 'package:app_7/presentation/screens/home/controller/cart.dart';
import 'package:app_7/presentation/screens/home/controller/home_controller.dart';
import 'package:app_7/presentation/screens/home/screens/ads_screen.dart';
import 'package:app_7/presentation/screens/home/screens/notifications_screen.dart';
import 'package:app_7/presentation/screens/home/widgets/drop_down.dart';
import 'package:app_7/presentation/screens/home/widgets/search_container.dart';
import 'package:app_7/core/constants/navigators.dart';
import 'package:app_7/presentation/widgets/sliders/auto_slider.dart';
import 'package:flutter/material.dart';
import 'package:motion_tab_bar/MotionTabBarController.dart';
import 'package:provider/provider.dart';
import '../../../../core/constants/ColorManager.dart';
import '../widgets/button_notifications.dart';
import '../widgets/item_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({required this.controller, super.key});

  final MotionTabBarController controller;

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  String currentSearch = "";

  @override
  void initState() {
    super.initState();
    Future.microtask(() => initializeData(context));
  }

  Future<void> initializeData(BuildContext context) async {
    final proCart = Provider.of<Cart_Controller>(context, listen: false);
    final proHome = Provider.of<Controller_Home>(context, listen: false);

    await proCart.loadUserFavorites();

    if (proCart.allAds.isEmpty) {
      await proCart.get_Values_Ads_Stream();
      proCart.filterByAll(
        city: proHome.selectedValue_City,
        category: proHome.selectedValue,
        description: currentSearch,
      );
    }
  }

  List<String> listImages = [
    'https://www.rowadalaamal.com/wp-content/uploads/2020/09/web-in3-24.jpg',
    'https://www.rowadalaamal.com/wp-content/uploads/2020/09/web-in3-24.jpg',
    'https://www.rowadalaamal.com/wp-content/uploads/2020/09/web-in3-24.jpg',
    'https://www.rowadalaamal.com/wp-content/uploads/2020/09/web-in3-24.jpg',
  ];

  Future<void> toggleFavourite(BuildContext context, int actualIndex, Cart_Controller proCart) async {
    final ad = proCart.allAds[actualIndex];
    final isFavourited = ad['action_favourier'] == 'true';

    // تحديث الحالة المؤقتة على الواجهة
    proCart.allAds[actualIndex]['action_favourier'] = isFavourited ? 'false' : 'true';

    if (isFavourited) {
      // تأكيد الحذف من المفضلة
      Show_Message_YYAlertDialog(
        context,
        "هل تريد حذف الإعلان من المفضلة؟",
        () async {
          await proCart.updateFavoriteStatus(
            isAdding: false,
            adData: ad,
          );

          if (!mounted) return;

          setState(() {
            proCart.favourites = !proCart.favourites;
          });

          await proCart.get_Values_Ads_Stream();
        },
      );
    } else {
      await proCart.updateFavoriteStatus(isAdding: true, adData: ad);

      if (!mounted) return;

      setState(() {});
    }

    proCart.updateNumber(proCart.list_favourites.length);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorManager.w_color,
        body: Consumer3<Controller_Home, Cart_Controller, Add_Controller>(
          builder: (BuildContext context, proHome, proCart, proADD, Widget? child) {
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  pinned: true,
                  backgroundColor: ColorManager.b_69,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30.0),
                      bottomRight: Radius.circular(30.0),
                    ),
                  ),
                  actions: [
                    Button_Notifications(true, 5, () {
                      pushNewScreen(context, const Notifications_Screen());
                    }),
                  ],
                  expandedHeight: 160,
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    titlePadding: const EdgeInsets.symmetric(vertical: 8),
                    title: SearchContainer(
                      onChanged: (value) {
                        setState(() {
                          currentSearch = value;
                          proCart.filterByAll(
                            city: proHome.selectedValue_City,
                            category: proHome.selectedValue,
                            description: currentSearch,
                          );
                        });
                      },
                    ),
                    background: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
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
                                  setState(() {
                                    proHome.selectedValue_City = value;
                                    proCart.filterByAll(
                                      city: proHome.selectedValue_City,
                                      category: proHome.selectedValue,
                                      description: currentSearch,
                                    );
                                  });
                                },
                              ),
                              Drop_Down_Items(
                                w: size.width / 3,
                                title: 'الأقسام',
                                selectedValue: proHome.selectedValue ?? '',
                                genderItems: proHome.data_Items_json,
                                onChanged: (value) {
                                  setState(() {
                                    proHome.selectedValue = value;
                                    proCart.filterByAll(
                                      city: proHome.selectedValue_City,
                                      category: proHome.selectedValue,
                                      description: currentSearch,
                                    );
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
                proCart.allAds.isEmpty
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
                          childCount: proCart.allAds.length + ((proCart.allAds.length - 1) ~/ 4),
                          (BuildContext context, int index) {
                            final actualIndex = index - (index ~/ 5); // كل 5 عناصر فيها 1 سلايدر

                            if (actualIndex < 0 || actualIndex >= proCart.allAds.length) {
                              return const SizedBox();
                            }

                            if (index % 5 == 4) {
                              // عرض السلايدر كل 5 عناصر (4 إعلانات + 1 سلايدر)
                              return Auto_Slider(context, imageList: listImages);
                            }

                            String actionFavourier = proCart.allAds[actualIndex]['action_favourier'] ?? 'false';
                            final imageList = proCart.allAds[actualIndex]['imageUrls'];
                            final firstImage = (imageList is List && imageList.isNotEmpty) ? imageList[0] : "";

                            return InkWell(
                              onTap: () {
                                proCart.update_num_Views(
                                  proCart.allAds[actualIndex]['id'],
                                  proCart.allAds[actualIndex]['num_views'],
                                );

                                pushNewScreen(
                                  context,
                                  Ads_Screen(
                                    list_favourites: proCart.allAds[actualIndex],
                                    id: proCart.allAds[actualIndex]['id'],
                                    imageUrls: imageList,
                                    selectedValue_City: proCart.allAds[actualIndex]['selectedValue_City'] ?? "",
                                    location: proCart.allAds[actualIndex]['location'] ?? "",
                                    selectItems: proCart.allAds[actualIndex]['selectItems'] ?? "",
                                    price: proCart.allAds[actualIndex]['price'] ?? "",
                                    date: proCart.allAds[actualIndex]['date'] ?? "",
                                    select_Status: proCart.allAds[actualIndex]['select_Status'] ?? "",
                                    select_Payment: proCart.allAds[actualIndex]['select_Payment'] ?? "",
                                    brand: proCart.allAds[actualIndex]['Brand'] ?? "",
                                    model: proCart.allAds[actualIndex]['model'] ?? "",
                                    description: proCart.allAds[actualIndex]['description'] ?? "",
                                    note: proCart.allAds[actualIndex]['note'] ?? "",
                                    num_views: proCart.allAds[actualIndex]['num_views'] ?? 0,
                                    action_favourier: actionFavourier,
                                  ),
                                );
                              },
                              child: ItemCard(
                                context,
                                onPressed: () => toggleFavourite(context, actualIndex, proCart),
                                imageUrls: firstImage,
                                price: proCart.allAds[actualIndex]['price'] ?? "",
                                description: proCart.allAds[actualIndex]['description'] ?? "",
                                action_color: actionFavourier == 'true' ? Colors.red : Colors.grey,
                                date: proCart.allAds[actualIndex]['date'] ?? "",
                                city: proCart.allAds[actualIndex]['selectedValue_City'] ?? "",
                                select_Items: proCart.allAds[actualIndex]['selectItems'] ?? "",
                                num_views: proCart.allAds[actualIndex]['num_views'] ?? 0,
                              ),
                            );
                          },
                        ),
                      ),
              ],
            );
          },
        ),
      ),
    );
  }
}
