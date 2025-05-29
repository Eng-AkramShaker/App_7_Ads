import 'package:app_7/core/constants/ColorManager.dart';
import 'package:flutter/material.dart';

Widget buildInfoRow({required IconData icon, required String label, required String value}) {
  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    child: ListTile(
      title: Text(label, style: const TextStyle(color: Colors.grey)),
      subtitle: Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
      trailing: const Icon(Icons.info_outline, color: ColorManager.primary),
      leading: Icon(icon, color: ColorManager.primary),
    ),
  );
}
