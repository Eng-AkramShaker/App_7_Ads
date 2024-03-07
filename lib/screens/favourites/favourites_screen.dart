import 'package:flutter/material.dart';
import 'package:motion_tab_bar/MotionTabBarController.dart';
import 'package:todotask/constes/ColorManager.dart';

import '../../widgets/card/card_adsense.dart';

class FavouritesScreen extends StatefulWidget {
  const FavouritesScreen({Key? key, required this.controller}) : super(key: key);
  final MotionTabBarController controller;

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
        title: Text('Favourites'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// to show fav or empty screen with text if there is no fav
            Container(
              height: size.height / 1.1,
              width: double.maxFinite,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: cardFav_Ads(
                      'https://hips.hearstapps.com/hmg-prod/images/2022-ford-e-transit-supervan-33-1655992304.jpg?crop=0.673xw:0.793xh;0.196xw,0.156xh&resize=980:*',
                      'Ford Pro Electric SuperVan',
                      'Ford says the Electric SuperVan can sprint to 60 mph',
                    ),
                  );
                },
              ),
            ),

            /// or for empty
//             Padding(
//               padding:  EdgeInsets.only(top: size.height*0.1),
//               child: Column(
// mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Center(
//                     child: CircleAvatar(
//                       radius: size.height*0.2,
//                       backgroundColor: ColorManager.w_FA,
//                       child: Icon(Icons.favorite_border,size: size.width*.3,color: ColorManager.w_color,),
//                     ),
//                   ) ,
//                   SizedBox(height: 30,) ,
//                   Text('OOPS' ,style: TextStyle(color:Colors.blue[300] ,fontSize: 30,fontWeight: FontWeight.bold),),
//                   Text('There is no Favourites Yet' ,style: TextStyle(color:Colors.blue[500] ,fontSize: 20,fontWeight: FontWeight.w600),),
//                   Text('Please add some first' ,style: TextStyle(color:Colors.blue[500] ,fontSize: 20,fontWeight: FontWeight.w600),),
//                 ],
//               ),
//             )
          ],
        ),
      ),
    );
  }
}
