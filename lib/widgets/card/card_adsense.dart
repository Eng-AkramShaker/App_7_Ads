// ignore_for_file: non_constant_identifier_names

import 'package:app7ads/constes/colormanager.dart';
import 'package:flutter/material.dart';

Widget cardFav_Ads(img, title, subText,) {
  return Card(
    elevation: 15,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20.0),
    ),
    color: ColorManager.b_69,
    child: Column(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
          child: Image.network(
            '$img',
            height: 180,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
        ),
        ListTile(
          title: Text(
            '$title',
            style: const TextStyle(color: Colors.black, fontSize: 22),
          ),
          subtitle: Text(
            '$subText',
            style: const TextStyle(color: Colors.white, fontSize: 15),
          ),
        ),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Row(
              children: [
                SizedBox.fromSize(
                  size: const Size(56, 56),
                  child: ClipOval(
                    child: Material(
                      color: ColorManager.w_FA,
                      child: InkWell(
                        splashColor: Colors.green,
                        onTap: () {},
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.shopping_cart,size: 20,), // <-- Icon
                            Text("Buy",style: TextStyle(fontSize: 14),), // <-- Text
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                SizedBox.fromSize(
                  size: const Size(56, 56),
                  child: ClipOval(
                    child: Material(
                      color: ColorManager.w_FA,
                      child: InkWell(
                        splashColor: Colors.green,
                        onTap: () {},
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.share_sharp,size: 20,), // <-- Icon
                            Text("share",style: TextStyle(fontSize: 14),), // <-- Text
                          ],
                        ),
                      ),
                    ),
                  ),
                ) ,
                const SizedBox(
                  width: 20,
                ),
                SizedBox.fromSize(
                  size: const Size(56, 56),
                  child: ClipOval(
                    child: Material(
                      color: Colors.red,
                      child: InkWell(
                        splashColor: Colors.green,
                        onTap: () {},
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.delete,color: Colors.white,size: 20,), // <-- Icon
                            Text("Delete",style: TextStyle(color: Colors.white,fontSize: 14),), // <-- Text
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ))
      ],
    ),
  );
}
Widget card_Ads(img, title, subText) {
  return Card(
    elevation: 15,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20.0),
    ),
    color: ColorManager.b_69,
    child: Column(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
          child: Image.network(
            '$img',
            height: 180,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
        ),
        ListTile(
          title: Text(
            '$title',
            style: const TextStyle(color: Colors.black, fontSize: 22),
          ),
          subtitle: Text(
            '$subText',
            style: const TextStyle(color: Colors.white, fontSize: 15),
          ),
        ),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Row(
              children: [
                SizedBox.fromSize(
                  size: const Size(56, 56),
                  child: ClipOval(
                    child: Material(
                      color: ColorManager.w_FA,
                      child: InkWell(
                        splashColor: Colors.green,
                        onTap: () {},
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.shopping_cart,size: 20,), // <-- Icon
                            Text("Buy",style: TextStyle(fontSize: 14),), // <-- Text
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                SizedBox.fromSize(
                  size: const Size(56, 56),
                  child: ClipOval(
                    child: Material(
                      color: ColorManager.w_FA,
                      child: InkWell(
                        splashColor: Colors.green,
                        onTap: () {},
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.share_sharp,size: 20,), // <-- Icon
                            Text("share",style: TextStyle(fontSize: 14),), // <-- Text
                          ],
                        ),
                      ),
                    ),
                  ),
                ) ,
                const SizedBox(
                  width: 20,
                ),

              ],
            ))
      ],
    ),
  );
}
