import 'package:flutter/material.dart';
import 'package:motion_tab_bar/MotionTabBarController.dart';
import 'package:provider/provider.dart';
import 'package:todotask/data/model/cart.dart';
import 'package:todotask/presentation/widgets/item_card.dart';
import 'package:todotask/utils/constants/ColorManager.dart';

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
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            'Favourites',
            style: TextStyle(
                color: ColorManager.primary, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Consumer<Cart>(
            builder: (BuildContext context, value, Widget? child) {
          return ListView.builder(
              itemCount: value.basket.length,
              itemBuilder: (context, index) {
                return ItemCard(
                  ontap: () {
                    value.remove(value.basket[index]);
                  },
                  icon: Icons.delete,
                  widget: const Center(),
                  productName: '',
                  price: '',
                  model: '',
                  location: '',
                  description: '',
                );
              });
        }));
  }
}
