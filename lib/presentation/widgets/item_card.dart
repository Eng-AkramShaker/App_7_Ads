import 'package:flutter/material.dart';
import 'package:todotask/utils/constants/ColorManager.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: Colors.white,
      child: Container(
        height: 170,
        decoration: BoxDecoration(
            border: Border.all(color: ColorManager.primary),
            color: Colors.white,
            borderRadius: BorderRadius.circular(20)),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const FittedBox(
                  child: Padding(
                    padding: EdgeInsets.only(right: 20),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "تيوتا",
                          style: TextStyle(
                              color: ColorManager.primary,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          " | ",
                          style: TextStyle(
                              fontSize: 40, color: ColorManager.grayColor),
                        ),
                        Text(
                          "كرولا",
                          style: TextStyle(
                              color: ColorManager.primary,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          " | ",
                          style: TextStyle(
                              fontSize: 40, color: ColorManager.grayColor),
                        ),
                        Text(
                          "2018",
                          style: TextStyle(
                              color: ColorManager.primary,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          " | ",
                          style: TextStyle(
                              fontSize: 40, color: ColorManager.grayColor),
                        ),
                        Text(
                          "3500",
                          style: TextStyle(
                              color: ColorManager.primary,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          " | ",
                          style: TextStyle(
                              fontSize: 40,
                              height: 0,
                              color: ColorManager.grayColor),
                        ),
                      ],
                    ),
                  ),
                ),
                const Text(
                  "  _______________________________________",
                  style: TextStyle(fontWeight: FontWeight.w800, height: 0),
                ),
                FittedBox(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10, top: 5),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          "الجيزة",
                          style: TextStyle(
                              color: ColorManager.primary,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        const Text(
                          " | ",
                          style: TextStyle(
                              fontSize: 40, color: ColorManager.grayColor),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              size: 20,
                              color: Colors.amber[400],
                            ),
                            Icon(
                              Icons.star,
                              size: 20,
                              color: Colors.amber[400],
                            ),
                            Icon(
                              Icons.star,
                              size: 20,
                              color: Colors.amber[400],
                            ),
                            Icon(
                              Icons.star,
                              size: 20,
                              color: Colors.amber[400],
                            )
                          ],
                        ),
                        const Text(
                          " | ",
                          style: TextStyle(
                              fontSize: 40, color: ColorManager.grayColor),
                        ),
                        const Text(
                          "26/1/2024",
                          style: TextStyle(
                              color: ColorManager.primary,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                FittedBox(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.favorite_border,
                          color: ColorManager.grayColor,
                        ),
                        SizedBox(
                          width: .5 * MediaQuery.sizeOf(context).width,
                        ),
                        Text(
                          "175\$",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.green[600]),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            Image.asset(
              "assets/images/car.png",
              width: 100,
            )
          ],
        ),
      ),
    );
  }
}
