// Profile =======================================================

// ignore_for_file: use_key_in_widget_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import '../../widgets/user_activity_info.dart';
import '../../widgets/user_info_widget.dart';
import '../../widgets/user_profile_image.dart';

class MyProfile extends StatefulWidget {
  @override
  State<MyProfile> createState() => MyProfileState();
}

class MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              buildUserImage(size),

              // * 3 user Name
              buildUserInfo(),

              //* 4 total no. of posts, followers, following (Row Widget)
              buildUserActivity(),

              // * 5 follow and message button (Row widget)
              buildUserEvents(size),

              // *
            ],
          ),
        ),
      ),
    );
  }

  Container buildUserEvents(Size size) {
    return Container(
        // color: Colors.grey.shade100,

        );
  }
}
