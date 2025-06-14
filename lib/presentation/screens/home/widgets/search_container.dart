import 'package:flutter/material.dart';
import 'package:app_7/core/constants/ColorManager.dart';

class SearchContainer extends StatelessWidget {
  final Function(String) onChanged;

  const SearchContainer({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width / 2,
      height: 33,
      alignment: Alignment.center,
      child: TextField(
        style: const TextStyle(fontSize: 13),
        textAlign: TextAlign.center,
        onChanged: onChanged, // 🔍 تنفيذ البحث هنا
        decoration: InputDecoration(
          hintText: " ....... البحث ",
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
          contentPadding: const EdgeInsets.symmetric(horizontal: 60, vertical: 0),
        ),
      ),
    );
  }
}
