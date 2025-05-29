import 'package:app_7/core/constants/ColorManager.dart';
import 'package:flutter/material.dart';

Widget buildEditableField(TextEditingController controller, String label, IconData icon, {bool obscure = false}) {
  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    child: TextFormField(
      controller: controller,
      obscureText: obscure,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: ColorManager.primary),
        labelText: label,
        border: InputBorder.none,
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      ),
    ),
  );
}
