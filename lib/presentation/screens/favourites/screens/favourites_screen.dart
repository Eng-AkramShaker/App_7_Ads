// ignore_for_file: unused_local_variable, non_constant_identifier_names

import 'package:app_7/core/constants/navigators.dart';
import 'package:app_7/presentation/screens/home/controller/cart.dart';
import 'package:app_7/presentation/screens/home/screens/ads_screen.dart';
import 'package:app_7/presentation/widgets/custom_tex2.dart';
import 'package:app_7/core/constants/ColorManager.dart';
import 'package:flutter/material.dart';
import 'package:motion_tab_bar/MotionTabBarController.dart';
import 'package:provider/provider.dart';
import '../../../../core/constants/show_messages.dart';
import '../../home/widgets/item_card.dart';
import '../../add/controller/add_controller.dart';

class FavouritesScreen extends StatefulWidget {
  final MotionTabBarController controller;

  const FavouritesScreen({super.key, required this.controller});

  @override
  State<FavouritesScreen> createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Consumer2<Cart_Controller, Add_Controller>(builder: (BuildContext context, proCart, proADD, Widget? child) {
      //
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            'المفضلة',
            style: TextStyle(color: ColorManager.primary, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                width: size.width,
                decoration: BoxDecoration(
                  border: Border.all(color: ColorManager.primary),
                  borderRadius: BorderRadius.circular(13),
                  color: Colors.white,
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomText(
                        text: " : ملحوظة\n الإعلانات التي قمت بتفضيلها تظل موجودة ٧ أيام من تاريخ ظهور الإعلان  ويتم حذفها تلقائيا",
                        color: ColorManager.redColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        textAlign: TextAlign.right,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Expanded(
                child: Consumer<Cart_Controller>(
                  builder: (BuildContext context, provider, Widget? child) {
                    return ListView.builder(
                      itemCount: proCart.list_favourites.length,
                      itemBuilder: (context, index) {
                        final data = proCart.list_favourites;
                        return Center(
                          child: InkWell(
                            onTap: () {
                              pushNewScreen(
                                  context,
                                  Ads_Screen(
                                    list_favourites: data[index],
                                    id: data[index]['id'],
                                    imageUrls: data[index]['imageUrls'],
                                    selectedValue_City: data[index]['selectedValue_City'] ?? "",
                                    location: data[index]['location'] ?? "",
                                    selectItems: data[index]['selectItems'] ?? "",
                                    price: data[index]['price'] ?? "",
                                    date: data[index]['date'] ?? "",
                                    select_Status: data[index]['select_Status'] ?? "",
                                    select_Payment: data[index]['select_Payment'] ?? "",
                                    brand: data[index]['Brand'] ?? "",
                                    model: data[index]['model'] ?? "",
                                    description: data[index]['description'] ?? "",
                                    note: data[index]['note'] ?? "",
                                    num_views: data[index]['num_views'] ?? "",
                                    action_favourier: data[index]['action_favourier'],
                                  ));
                            },
                            child: ItemCard(
                              context,
                              onPressed: () {
                                Show_Message_YYAlertDialog(
                                  context,
                                  "هل تريد حذف الاعلان؟",
                                  () async {
                                    provider.remove(proCart.list_favourites[index]);
                                    setState(() {
                                      provider.updateNumber(proCart.list_favourites.length);
                                      provider.favourites = !provider.favourites;
                                    });

                                    await provider.get_Values_Ads_Stream();
                                  },
                                );
                              },
                              action_color: ColorManager.redColor,
                              imageUrls: data[index]['imageUrls'][0],
                              price: data[index]['price'],
                              location: data[index]['location'],
                              description: data[index]['description'],
                              date: data[index]['date'],
                              city: data[index]['selectedValue_City'],
                              select_Items: data[index]['selectItems'],
                              num_views: data[index]['num_views'],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
