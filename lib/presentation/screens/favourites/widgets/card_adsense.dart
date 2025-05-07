// ignore_for_file: non_constant_identifier_names, avoid_unnecessary_containers, sized_box_for_whitespace, unused_local_variable

import 'package:app_7/presentation/widgets/custom_tex2.dart';
import 'package:flutter/material.dart';

import 'package:app_7/core/constants/ColorManager.dart';

Widget cardFav_Ads(
  img,
  title,
  subText,
) {
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
            height: 50,
            width: 180,

            // fit: BoxFit.cover,
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
                      color: ColorManager.primary,
                      child: InkWell(
                        splashColor: Colors.green,
                        onTap: () {},
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.shopping_cart,
                              size: 20,
                            ), // <-- Icon
                            Text(
                              "Buy",
                              style: TextStyle(fontSize: 14),
                            ), // <-- Text
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
                      color: ColorManager.primary,
                      child: InkWell(
                        splashColor: Colors.green,
                        onTap: () {},
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.share_sharp,
                              size: 20,
                            ), // <-- Icon
                            Text(
                              "share",
                              style: TextStyle(fontSize: 14),
                            ), // <-- Text
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
                      color: Colors.red,
                      child: InkWell(
                        splashColor: Colors.green,
                        onTap: () {},
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.delete,
                              color: Colors.white,
                              size: 20,
                            ), // <-- Icon
                            Text(
                              "Delete",
                              style: TextStyle(color: Colors.white, fontSize: 14),
                            ), // <-- Text
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

// =======================================================================

Widget card_Ads(context, img, title, subText) {
  var size = MediaQuery.of(context).size;

  return Container(
    height: 100,
    width: size.width / 1.04,
    decoration: BoxDecoration(
      color: const Color.fromARGB(255, 219, 219, 219),
      borderRadius: BorderRadius.circular(20.0),
      boxShadow: [
        BoxShadow(
          color: const Color.fromARGB(255, 219, 219, 219).withOpacity(0.5),
          spreadRadius: 2, //spread radius
          blurRadius: 1, // blur radius
          offset: const Offset(0, 1),
        ),
      ],
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            CustomText(text: '2024/01/12', fontSize: 13, color: ColorManager.primary),
          ],
        ),

        // Image ============================
        Container(
          height: 120,
          width: 120,
          child: Image.network(
            '$img',

            // fit: BoxFit.cover,
          ),
        ),
      ],
    ),
  );
}
