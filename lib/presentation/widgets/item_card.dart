import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todotask/data/model/cart.dart';
import 'package:todotask/utils/constants/ColorManager.dart';

class ItemCard extends StatelessWidget {
  ItemCard({
    super.key,
    required this.ontap,
    required this.icon,
    required this.widget, required this.productName, required this.price, required this.model, required this.location, required this.description,
  });
  final void Function() ontap;
  final IconData icon;
  final Widget widget;
final  String productName;
 final String price;
 final String model;
 final String location;
 final String description;
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
                FittedBox(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          productName!,
                          style: const TextStyle(
                              color: ColorManager.primary,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        const Text(
                          " | ",
                          style: TextStyle(
                              fontSize: 40, color: ColorManager.grayColor),
                        ),
                        Text(
                          model!,
                          style: const TextStyle(
                              color: ColorManager.primary,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        const Text(
                          " | ",
                          style: TextStyle(
                              fontSize: 40, color: ColorManager.grayColor),
                        ),
                        const Text(
                          "2018",
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
                        const Text(
                          "3500",
                          style: TextStyle(
                              color: ColorManager.primary,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        const Text(
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
                        Text(
                          location!,
                          style: const TextStyle(
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
                        Consumer<Cart>(
                          builder:
                              (BuildContext context, value, Widget? child) {
                            return GestureDetector(
                              onTap: ontap,
                              child: Icon(
                                icon,
                                color: ColorManager.grayColor,
                              ),
                            );
                          },
                        ),
                        SizedBox(
                          width: .5 * MediaQuery.sizeOf(context).width,
                        ),
                        Text(
                          "$price\$",
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
            widget
          ],
        ),
      ),
    );
  }
}
