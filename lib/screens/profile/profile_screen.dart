// Profile =======================================================

// ignore_for_file: use_key_in_widget_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import '../../widgets/user_activity_info.dart';
import '../../widgets/user_info_widget.dart';
import '../../widgets/user_profile_image.dart';

// class MyProfile extends StatefulWidget {
//   @override
//   State<MyProfile> createState() => MyProfileState();
// }

// class MyProfileState extends State<MyProfile> {
//   @override
//   Widget build(BuildContext context) {
//     return
//         // const Home();

//         SafeArea(
//       child: Directionality(
//         textDirection: TextDirection.rtl,
//         child: Scaffold(
//             backgroundColor: Colors.black,
//             body: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Center(
//                   child: Profile(
//                     imageUrl:
//                         "https://icons.veryicon.com/png/o/miscellaneous/user-avatar/user-avatar-male-5.png",
//                     name: "",
//                     website: "",
//                     designation: "",
//                     email: "",
//                     phone_number: "",
//                   ),
//                 ),
//                 const Text(
//                   'Divya Sharma',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 40.0,
//                     fontWeight: FontWeight.bold,
//                     fontFamily: 'Satisfy',
//                   ),
//                 ),
//               ],
//             )

//             //  Padding(
//             //   padding: const EdgeInsets.all(20),
//             //   child: Column(
//             //     children: [
//             //       const CircleAvatar(
//             //         radius: 50,
//             //         backgroundImage:
//             //             AssetImage('assets/images/illustration-3.png'),
//             //         child: Column(
//             //           crossAxisAlignment: CrossAxisAlignment.start,
//             //         ),
//             //       ),
//             //       Text(
//             //         'FLUTTER DEVELOPER',
//             //         style: TextStyle(
//             //           fontSize: 15.0,
//             //           color: Colors.teal[50],
//             //           fontWeight: FontWeight.bold,
//             //           fontFamily: 'SourceSansPro',
//             //           letterSpacing: 2.0,
//             //         ),
//             //       ),
//             //       SizedBox(
//             //         width: 200.0,
//             //         height: 10.0,
//             //         child: Divider(
//             //           color: Colors.cyan[100],
//             //           thickness: 1.5,
//             //         ),
//             //       ),
//             //       Card(
//             //         elevation: 10.0,
//             //         child: Container(
//             //           height: 50,
//             //           width: 320,
//             //           child: ListTile(
//             //             title: Text(
//             //               '+91 9723466602',
//             //               style: TextStyle(
//             //                 fontFamily: 'SourceSansPro',
//             //                 fontSize: 16,
//             //                 fontWeight: FontWeight.bold,
//             //                 color: Colors.teal[800],
//             //                 letterSpacing: 1.0,
//             //               ),
//             //             ),
//             //             leading: Icon(
//             //               Icons.phone,
//             //               color: Colors.teal[800],
//             //             ),
//             //           ),
//             //         ),
//             //       ),
//             //       Card(
//             //         elevation: 10.0,
//             //         child: Container(
//             //           height: 50,
//             //           width: 320,
//             //           child: ListTile(
//             //             title: Text(
//             //               'sharmadivyadfg2304@gmail.com',
//             //               style: TextStyle(
//             //                 fontFamily: 'SourceSansPro',
//             //                 fontSize: 15,
//             //                 fontWeight: FontWeight.bold,
//             //                 color: Colors.teal[800],
//             //               ),
//             //             ),
//             //             leading: Icon(
//             //               Icons.email,
//             //               color: Colors.teal[800],
//             //             ),
//             //           ),
//             //         ),
//             //       ),
//             //       Container(),
//             //     ],
//             //   ),
//             // ),
//             ),
//       ),
//     );
//   }
// }

class MyProfile extends StatefulWidget {
  @override
  State<MyProfile> createState() => MyProfileState();
}

class MyProfileState extends State<MyProfile> {
  final int _selectedEvent = 0;

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
