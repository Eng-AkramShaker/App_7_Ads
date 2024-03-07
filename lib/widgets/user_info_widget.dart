import 'package:flutter/material.dart';

Container buildUserInfo() {
  return Container(
    child: ListTile(
      title: Row(
        children: [
          const Text(
            "أكرم ابو بكر شاكر",
            style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                fontSize: 22),
          ),
          const SizedBox(width: 13),
          InkWell(
            onTap: () {},
            child: const Text(
              "Follow",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
      subtitle: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                Icon(
                  Icons.home,
                  color: Colors.grey.shade400,
                ),
                const SizedBox(width: 5),
                const Text(
                  "أسوان - العقاد",
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                Icon(
                  Icons.person,
                  color: Colors.grey.shade400,
                ),
                const SizedBox(width: 5),
                const Text(
                  "ذكر",
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                Icon(
                  Icons.badge_sharp,
                  color: Colors.grey.shade400,
                ),
                const SizedBox(width: 5),
                const Text(
                  "مبرمج",
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
