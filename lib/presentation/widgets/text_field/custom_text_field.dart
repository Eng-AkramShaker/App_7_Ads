// ignore_for_file: deprecated_member_use

import 'package:app_7/core/constants/ColorManager.dart';
import 'package:app_7/core/constants/app_sizes.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String hint;
  final bool secure;
  final IconData? icon;
  final TextEditingController controlller;
  void Function()? onTap;

  final String? Function(String?)? validator;

  CustomTextField({
    super.key,
    required this.hint,
    this.onTap,
    required this.secure,
    this.icon,
    required this.controlller,
    this.validator,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Container(
        // height: 60,
        width: .9 * width_media(context),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: Colors.grey.withOpacity(.1)),
        child: TextFormField(
          controller: widget.controlller,
          obscureText: widget.secure,
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: ColorManager.primary,
                width: 2.0,
              ),
            ),
            contentPadding: const EdgeInsets.all(10),
            border: InputBorder.none,
            suffixIcon: widget.icon != null
                ? GestureDetector(
                    child: Icon(
                      widget.icon,
                      color: Colors.grey[400],
                    ),
                  )
                : SizedBox(height: 5),
            hintText: widget.hint,
            hintStyle: TextStyle(
                color: theme.brightness == Brightness.light ? const Color(0xff393F42) : Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w400),
          ),
          validator: widget.validator,
        ),
      ),
    );
  }
}
