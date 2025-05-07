// ignore_for_file: camel_case_types, avoid_print, unused_local_variable, non_constant_identifier_names, must_be_immutable

import 'package:app_7/presentation/screens/add/controller/add_controller.dart';
import 'package:app_7/presentation/screens/home/controller/cart.dart';
import 'package:app_7/presentation/screens/home/controller/home_controller.dart';
import 'package:app_7/presentation/screens/home/widgets/icon_button.dart';
import 'package:app_7/presentation/widgets/custom_tex2.dart';
import 'package:app_7/presentation/widgets/sliders/auto_slider.dart';
import 'package:flutter/material.dart';
import 'package:app_7/core/constants/ColorManager.dart';
import 'package:provider/provider.dart';

class Ads_Screen extends StatefulWidget {
  Map<String, dynamic> list_favourites;
  String? id;
  List? imageUrls;
  String? selectedValue_City;
  String? location;
  String? selectItems;
  String? price;
  String? date;
  String? select_Status;
  String? select_Payment;
  String? brand;
  String? model;
  String? description;
  String? note;
  int? num_views;

  String? action_favourier;

  Ads_Screen({
    super.key,
    required this.list_favourites,
    required this.id,
    required this.imageUrls,
    required this.selectedValue_City,
    required this.location,
    required this.selectItems,
    required this.price,
    required this.date,
    required this.select_Status,
    required this.select_Payment,
    required this.brand,
    required this.model,
    required this.description,
    required this.note,
    required this.num_views,
    required this.action_favourier,
  });

  @override
  State<Ads_Screen> createState() => _Ads_ScreenState();
}

class _Ads_ScreenState extends State<Ads_Screen> {
  @override
  void initState() {
    ints(context);
    super.initState();
  }

  ints(context) async {}

  @override
  Widget build(BuildContext context) {
    return Consumer3<Controller_Home, Cart_Controller, Add_Controller>(
        builder: (BuildContext context, proHome, proCart, proADD, Widget? child) {
      //
      return SafeArea(
        child: Scaffold(
          appBar: buildAppBar(),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(19),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Auto_Slider(context, h: 300, imageList: widget.imageUrls),
                  const SizedBox(height: 30),
                  buildActionButtons(proCart, num_views: widget.num_views!),
                  const SizedBox(height: 30),
                  buildInfoRow(': السعر', widget.price!),
                  buildInfoRow(': المدينة', widget.selectedValue_City!),
                  buildInfoRow(': العلامة التجارية', widget.brand!),
                  buildInfoRow(': الموديل', widget.model!),
                  buildInfoRow(': الحالة', widget.select_Status!),
                  buildInfoRow(': الوصف', widget.description!),
                  buildInfoRow(': الملحوظة', widget.note!),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomText(
                        text: 'الإبلاغ عن الإعلان ',
                        color: ColorManager.primary,
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                      Container(
                          height: 70, width: 80, alignment: Alignment.centerRight, child: Icon_Button(true, Icons.feedback, () {})),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: ColorManager.primary),
                      borderRadius: BorderRadius.circular(13),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Center(
                        child: CustomText(
                          text: 'ساعدنا في الحصول علي مجتمع أفضل !',
                          color: ColorManager.primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  AppBar buildAppBar() {
    return AppBar(
        backgroundColor: Colors.white,
        title: const Text('صفحة الإعلان', style: TextStyle(color: ColorManager.primary, fontWeight: FontWeight.bold)),
        centerTitle: true);
  }

  Widget buildActionButtons(Cart_Controller proCart, {required num_views}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildIconButton(Icons.visibility, num_views ?? '0'),
        Container(
            height: 70,
            child: Icon_Button(true, Icons.favorite_border, () async {
              //

              setState(() {
                final isFavourited = widget.action_favourier == 'true';
                widget.action_favourier = isFavourited ? 'false' : 'true';

                if (isFavourited) {
                  proCart.list_favourites.removeWhere((item) => item['location'] == widget.location);
                } else {
                  proCart.list_favourites.add(widget.list_favourites);
                }
              });

              proCart.updateNumber(proCart.list_favourites.length);

              proCart.update_Favourites(widget.id!, widget.action_favourier!);
            })),
        Container(height: 70, child: Icon_Button(true, Icons.phone, () {})),
      ],
    );
  }

  Widget buildIconButton(IconData icon, int label) {
    return SizedBox(
      height: 60,
      child: Stack(
        children: [
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorManager.primary,
              shape: const CircleBorder(),
            ).copyWith(
              overlayColor: MaterialStateProperty.all(ColorManager.primary),
              side: MaterialStateProperty.all(
                const BorderSide(color: ColorManager.primary, width: 1.3),
              ),
            ),
            child: Icon(
              icon,
              color: ColorManager.w_color,
            ),
          ),
          Positioned(
            left: 0,
            bottom: 0,
            child: Text(
              '$label',
              style: const TextStyle(
                color: ColorManager.primary,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: ColorManager.primary),
                borderRadius: BorderRadius.circular(13),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Center(
                  child: CustomText(
                    text: value,
                    color: ColorManager.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              width: 130,
              alignment: Alignment.centerRight,
              child: CustomText(
                text: label,
                color: ColorManager.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
