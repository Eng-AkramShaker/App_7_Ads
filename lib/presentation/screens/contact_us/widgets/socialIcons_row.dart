import 'package:flutter/material.dart';

class BuildSocialMedialIconsRow extends StatelessWidget {
  const BuildSocialMedialIconsRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CircleAvatar(
            radius: 25,
            child: Icon(
              Icons.facebook,
              size: 35,
            )),
        const SizedBox(
          width: 4.0,
        ),
        const CircleAvatar(
            backgroundColor: Colors.black,
            radius: 25,
            child: Icon(Icons.tiktok, size: 35, color: Colors.white)),
        const SizedBox(
          width: 4.0,
        ),
        CircleAvatar(
            backgroundColor: Colors.red,
            radius: 25,
            child: Image.asset('assets/images/youtube.png')),
        const SizedBox(
          width: 4.0,
        ),
        const SizedBox(
          width: 4.0,
        ),
        CircleAvatar(
            backgroundColor: Colors.black,
            radius: 25,
            child: Image.asset('assets/images/telegram.png')),
      ],
    );
  }
}
