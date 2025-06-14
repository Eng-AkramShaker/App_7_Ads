// ignore_for_file: must_be_immutable, prefer_const_constructors, avoid_print, non_constant_identifier_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_7/presentation/screens/home/controller/cart.dart';
import 'package:app_7/presentation/widgets/custom_tex2.dart';
import 'package:app_7/presentation/widgets/sliders/auto_slider.dart';
import 'package:app_7/core/constants/ColorManager.dart';
import 'package:app_7/presentation/screens/home/widgets/icon_button.dart';

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
  bool isFavourite = false;

  @override
  void initState() {
    super.initState();
    isFavourite = widget.action_favourier == 'true';
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart_Controller>(
      builder: (context, proCart, child) {
        return SafeArea(
          child: Scaffold(
            appBar: buildAppBar(),
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(19),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Auto_Slider(context, h: 300, imageList: widget.imageUrls),
                  const SizedBox(height: 30),
                  buildActionButtons(proCart),
                  const SizedBox(height: 30),
                  buildInfoRow(': السعر', widget.price ?? ''),
                  buildInfoRow(': المدينة', widget.selectedValue_City ?? ''),
                  buildInfoRow(': العلامة التجارية', widget.brand ?? ''),
                  buildInfoRow(': الموديل', widget.model ?? ''),
                  buildInfoRow(': الحالة', widget.select_Status ?? ''),
                  buildInfoRow(': الوصف', widget.description ?? ''),
                  buildInfoRow(': الملحوظة', widget.note ?? ''),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      title: const Text('صفحة الإعلان', style: TextStyle(color: ColorManager.primary)),
      centerTitle: true,
    );
  }

  Widget buildActionButtons(Cart_Controller proCart) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildIconButton(Icons.visibility, widget.num_views ?? 0),
        const SizedBox(width: 20),
        Icon_Button(
          true,
          isFavourite ? Icons.favorite : Icons.favorite_border,
          () async {
            setState(() {
              isFavourite = !isFavourite;
            });

            await proCart.updateFavoriteStatus(
              isAdding: isFavourite,
              adData: widget.list_favourites,
            );

            proCart.updateNumber(proCart.list_favourites.length);
          },
        ),
        const SizedBox(width: 20),
        Icon_Button(true, Icons.phone, () {
          // تنفيذ الاتصال أو حوار
        }),
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
            ),
            child: Icon(icon, color: Colors.white),
          ),
          Positioned(
            left: 0,
            bottom: 0,
            child: Text(
              '$label',
              style: const TextStyle(color: ColorManager.primary, fontSize: 15, fontWeight: FontWeight.bold),
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
          const SizedBox(width: 10),
          Container(
            width: 130,
            alignment: Alignment.centerRight,
            child: CustomText(
              text: label,
              color: ColorManager.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
