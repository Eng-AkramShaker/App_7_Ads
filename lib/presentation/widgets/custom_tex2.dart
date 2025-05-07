import 'package:flutter/material.dart';
import 'package:app_7/core/constants/ColorManager.dart';

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
  final double? lineHeight;
  final TextOverflow overflow;

  const CustomText({
    super.key,
    required this.text,
    this.color = ColorManager.textColor,
    this.fontSize = 16,
    this.fontWeight = FontWeight.w400,
    this.textAlign,
    this.fontFamily,
    this.textDecoration,
    this.wordSpacing,
    this.maxLines,
    this.lineHeight,
    this.overflow = TextOverflow.visible,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        height: lineHeight,
        wordSpacing: wordSpacing,
        overflow: overflow,
        decoration: textDecoration,
        fontFamily: fontFamily,
      ),
      textAlign: textAlign,
      maxLines: maxLines,
    );
  }
}
