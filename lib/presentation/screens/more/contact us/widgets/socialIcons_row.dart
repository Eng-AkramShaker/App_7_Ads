// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BuildSocialMedialIconsRow extends StatelessWidget {
  const BuildSocialMedialIconsRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            open_web('https://www.facebook.com/profile.php?id=61559610145593&sk=about');
          },
          child: CircleAvatar(backgroundColor: Colors.white, radius: 25, child: Image.asset('assets/images/face.png')),
        ),
        const SizedBox(width: 20),
        InkWell(
            onTap: () {
              open_web('https://www.instagram.com/canaryapp.eg?igsh=N210aHE1dnN6YWc1');
            },
            child: CircleAvatar(
                backgroundColor: Colors.white, radius: 25, child: Image.asset('assets/images/inst.png', fit: BoxFit.fill))),
        const SizedBox(width: 20),
        InkWell(
          onTap: () {
            open_web('https://www.youtube.com/@app.canary');
          },
          child: CircleAvatar(backgroundColor: Colors.red, radius: 25, child: Image.asset('assets/images/you.png')),
        ),
        const SizedBox(width: 20),
        InkWell(
          onTap: () {
            open_web(
                'https://www.tiktok.com/@canary.app?_d=secCgYIASAHKAESPgo8%2BWCLvSi9Pz3Qd60vv9AeUbPPMYCx%2BiyDjjZ%2FjQugdTwuFjrFlB%2ByIrPCGOQApRJ22sKfaBoXO%2BdKRnQHGgA%3D&_r=1&object_id=7422369625588188165&page_open_method=scan_code&schema_type=4&sec_uid=MS4wLjABAAAAs4wS-vgIBlLLfkhVIiZjpYJCmyape3aBnTeZBNTVZGhDfsiAyGT-NVxdFMFoxMnh&share_app_id=1233&share_author_id=7422369625588188165&share_uid=7422369625588188165&tt_from=scan_code&utm_campaign=client_scan_code&utm_medium=2&utm_source=scan_code');
          },
          child:
              CircleAvatar(backgroundColor: Colors.white, radius: 25, child: Image.asset('assets/images/tik.png', fit: BoxFit.fill)),
        ),
        const SizedBox(width: 12),
        // InkWell(
        //     onTap: () {
        //       open_web('https://telegram.org/android');
        //     },
        //     child: CircleAvatar(backgroundColor: Colors.white, radius: 25, child: Image.asset('assets/images/telegram.png'))),
      ],
    );
  }
}

open_web(String url) async {
  final Uri uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    throw 'Could not launch $url';
  }
}
