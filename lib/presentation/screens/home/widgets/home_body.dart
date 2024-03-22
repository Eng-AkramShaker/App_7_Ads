import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:motion_tab_bar/MotionTabBarController.dart';
import 'package:provider/provider.dart';
import 'package:todotask/data/model/cart.dart';
import 'package:todotask/data/model/product.dart';
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
    Future.delayed(const Duration(seconds: 5));
    _getImageUrls();
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
    List<Item> items = [
      Item('Ultra', 250),
      Item('30pro', 3000),
      Item('Samsong', 270),
      Item('hawawi', 200),
    ];
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
              child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('advertisementcards')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      return snapshot.data!.docs.isNotEmpty
                          ? Container(
                              margin: const EdgeInsets.only(
                                  top: 20, left: 5, right: 1),
                              width: 500,
                              height: 200,
                              child: ListView.builder(
                                  itemCount: snapshot.data!.docs.isNotEmpty
                                      ? snapshot.data!.docs.length
                                      : 1,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    final data = snapshot.data!.docs;
                                    return Consumer<Cart>(
                                      builder: (BuildContext context, value,
                                          Widget? child) {
                                        return ItemCard(
                                          ontap: () {
                                            value.add(items[index]);
                                          },
                                          icon: Icons.favorite_border,
                                          widget: _imageUrls.isEmpty
                                              ? const CircularProgressIndicator()
                                              : Image.network(
                                                  _imageUrls[index],
                                                  width: 70,
                                                  fit: BoxFit.contain,
                                                  errorBuilder: (context, error,
                                                      stackTrace) {
                                                    return const Icon(
                                                        Icons.broken_image);
                                                  },
                                                ),
                                          productName:
                                              data[index]['name'] ?? "",
                                          price: data[index]['price'] ?? "",
                                          model: data[index]['model'] ?? "",
                                          location:
                                              data[index]['location'] ?? "",
                                          description:
                                              data[index]['description'] ?? "",
                                        );
                                      },
                                    );
                                  }),
                            )
                          : const Center(
                              child:
                                  Text("You didn’ t add ant advertisment yet"),
                            );
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }

  List<String> _imageUrls = [];

  Future<void> _getImageUrls() async {
    try {
      final firebase_storage.FirebaseStorage storage =
          firebase_storage.FirebaseStorage.instance;
      final firebase_storage.Reference ref =
          storage.ref('advImages'); // Specify the reference path here
      final firebase_storage.ListResult result = await ref.listAll();

      final List<String> urls = [];
      for (final firebase_storage.Reference item in result.items) {
        final String downloadUrl = await item.getDownloadURL();
        urls.add(downloadUrl);
      }

      setState(() {
        _imageUrls = urls;
      });
    } catch (e) {
      print('Error fetching image URLs: $e');
    }
  }
}
