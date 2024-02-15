import 'package:flutter/material.dart';

class buildSocialMedialIconsRow extends StatelessWidget {
  const buildSocialMedialIconsRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
            radius: 25,
            child: Icon(
              Icons.facebook,
              size: 35,
            )),
        SizedBox(
          width: 4.0,
        ),
        CircleAvatar(
            backgroundColor: Colors.black,
            radius: 25,
            child: Icon(
              Icons.tiktok,
              size: 35,
            )),
        SizedBox(
          width: 4.0,
        ),
        CircleAvatar(
            backgroundColor: Colors.red,
            radius: 25,
            child: Image.asset('assets/images/youtube.png')),
        SizedBox(
          width: 4.0,
        ),
        CircleAvatar(
            backgroundColor: Colors.black,
            radius: 25,
            child: Image.asset('assets/images/x.jpg')),
        SizedBox(
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
