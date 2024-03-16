import 'package:flutter/material.dart';
import 'package:motion_tab_bar/MotionTabBarController.dart';
import 'package:todotask/presentation/widgets/item_card.dart';
import 'package:todotask/utils/constants/ColorManager.dart';
import '../widgets/card_adsense.dart';

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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildFavouritesList(size),
          ],
        ),
      ),
    );
  }

  Widget _buildFavouritesList(Size size) {
    return SizedBox(
      height: size.height / 1.1,
      width: double.infinity,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(5),
            child: _buildFavouriteCard(),
          );
        },
      ),
    );
  }

  Widget _buildFavouriteCard() {
    return const ItemCard();
  }
}
