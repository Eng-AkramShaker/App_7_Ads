import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todotask/utils/constants/ColorManager.dart';

class SearchContainer extends StatelessWidget {
  const SearchContainer({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width / 2,
      height: 35,
      alignment: Alignment.center,
      child: TextField(
        style: const TextStyle(fontSize: 13),
        decoration: InputDecoration(
          hintText: " البحث ..... ",
          fillColor: ColorManager.w_color,
          filled: true,
          suffixIcon: const Icon(
            Icons.search,
            size: 15,
            color: ColorManager.primary,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7),
            borderSide: const BorderSide(
              color: ColorManager.primary,
            ),
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        ),
      ),
    );
  }
}
