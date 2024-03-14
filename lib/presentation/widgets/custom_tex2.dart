import 'package:flutter/material.dart';
import 'package:todotask/utils/constants/ColorManager.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color color;
  final TextAlign? textAlign;
  final String? fontFamily;

  final double fontSize;
  final double? wordSpacing;
  final TextDecoration? textDecoration;

  final FontWeight fontWeight;

  final int? maxLines;

  const CustomText(
      {super.key,
      this.maxLines = 1,
      this.fontFamily,
      this.textAlign,
      this.textDecoration,
      required this.text,
      this.wordSpacing,
      this.color = ColorManager.textColor,
      this.fontSize = 16,
      this.fontWeight = FontWeight.w400});

  @override
  Widget build(BuildContext context) {
    return Text(
      overflow: maxLines! > 3 ? TextOverflow.ellipsis : TextOverflow.visible,
      text,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        height: 1.20,
        wordSpacing: wordSpacing,
        overflow: TextOverflow.visible,
        decoration: textDecoration,
        fontFamily: fontFamily,
      ),
      maxLines: maxLines,
      textAlign: textAlign,
    );
  }
}
