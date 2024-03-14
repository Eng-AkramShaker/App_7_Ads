import 'package:flutter/material.dart';
import 'package:motion_tab_bar/MotionTabBarController.dart';
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
        backgroundColor: ColorManager.b_69,
        title: const Text('Favourites'),
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
            padding: const EdgeInsets.all(10),
            child: _buildFavouriteCard(),
          );
        },
      ),
    );
  }

  Widget _buildFavouriteCard() {
    return cardFav_Ads(
      'https://hips.hearstapps.com/hmg-prod/images/2022-ford-e-transit-supervan-33-1655992304.jpg?crop=0.673xw:0.793xh;0.196xw,0.156xh&resize=980:*',
      'Ford Pro Electric SuperVan',
      'Ford says the Electric SuperVan can sprint to 60 mph',
    );
  }
}
