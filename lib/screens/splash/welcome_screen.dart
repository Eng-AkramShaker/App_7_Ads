// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors, unnecessary_import, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('SliverAppBar'),
              background: Image.network(
                'https://images.unsplash.com/photo-1523712999610-f77fbcfc3843?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
                fit: BoxFit.cover,
              ),
            ),
            floating: true, // Your appBar appears immediately
            snap: true, // Your appBar displayed %100 or %0
            pinned: true, // Your appBar pinned to top
          ),
        ],
        body: Column(
          children: [
            //
          ],
        ),
      ),
    );

    // Scaffold(
    //   resizeToAvoidBottomInset: false,
    //   backgroundColor: ColorManager.w_FA,
    //   body: Padding(
    //     padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 32),
    //     child: SingleChildScrollView(
    //       child: Column(
    //         children: [
    //           SliverAppBar(
    //             pinned: true,
    //             leading: IconButton(
    //               icon: Icon(Icons.menu),
    //               onPressed: () {},
    //             ),
    //             expandedHeight: 200,

    //             flexibleSpace: _showTitle
    //                 ? null
    //                 : FlexibleSpaceBar(
    //                     title: Column(
    //                       mainAxisAlignment: MainAxisAlignment.end,
    //                       children: <Widget>[
    //                         Text('_SliverAppBar'),
    //                         TextField(
    //                           controller: _filter,
    //                           decoration: InputDecoration(
    //                               prefixIcon: Icon(Icons.search),
    //                               hintText: 'Search...'),
    //                         ),
    //                       ],
    //                     ),
    //                     background: Column(
    //                       mainAxisAlignment: MainAxisAlignment.center,
    //                       children: const <Widget>[
    //                         Text('Info'),
    //                       ],
    //                     ),
    //                   ),
    //           ),

    //           // Image.asset(
    //           //   'assets/images/illustration-1.png',
    //           //   width: 180,
    //           // ),
    //           // const SizedBox(
    //           //   height: 18,
    //           // ),
    //           // const Text(
    //           //   "Let's get started",
    //           //   style: TextStyle(
    //           //     fontSize: 22,
    //           //     fontWeight: FontWeight.bold,
    //           //     color: ColorManager.b_69,
    //           //   ),
    //           // ),
    //           // const SizedBox(
    //           //   height: 10,
    //           // ),
    //           // const Text(
    //           //   "Never a better time than now to start.",
    //           //   style: TextStyle(
    //           //     fontSize: 14,
    //           //     fontWeight: FontWeight.bold,
    //           //     color: ColorManager.b_69,
    //           //   ),
    //           //   textAlign: TextAlign.center,
    //           // ),
    //           // const SizedBox(
    //           //   height: 40,
    //           // ),
    //           // InkWell(
    //           //   onTap: () {
    //           //     Get.to(const Register());
    //           //   },
    //           //   child: Center(
    //           //     child: Container(
    //           //       width: 500,
    //           //       height: 60,
    //           //       decoration: BoxDecoration(
    //           //         color: ColorManager.b_69,
    //           //         borderRadius: BorderRadius.circular(20),
    //           //         boxShadow: [
    //           //           BoxShadow(
    //           //             color: Colors.grey.withOpacity(0.4),
    //           //             spreadRadius: 5, //spread radius
    //           //             blurRadius: 8, // blur radius
    //           //             offset: const Offset(0, 0),
    //           //           ),
    //           //         ],
    //           //       ),
    //           //       child: Center(
    //           //         child: Text(
    //           //           'التسجيل',
    //           //           style: const TextStyle(
    //           //             color: ColorManager.w_FA,
    //           //             fontSize: 20.0,
    //           //             fontWeight: FontWeight.w500,
    //           //             fontFamily: 'Tajawal',
    //           //           ),
    //           //         ),
    //           //       ),
    //           //     ),
    //           //   ),
    //           // ),
    //           // const SizedBox(
    //           //   height: 38,
    //           // ),
    //           // InkWell(
    //           //   onTap: () {
    //           //     //

    //           //     // Get.to(const Otp());
    //           //   },
    //           //   child: Custom_Button(h: 60, w: 300, text: 'تسجيل الدخول'),
    //           // ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}

// CustomScrollView(
//                 slivers: [
//                   SliverAppBar(
//                     stretch: false,
//                     expandedHeight: 200.0,
//                     floating: false, //This is not needed since it's default
//                     pinned: true,
//                     flexibleSpace: FlexibleSpaceBar(
//                         centerTitle: true,
//                         title: Container(
//                           height: 50,
//                           child: TextField(
//                             decoration: InputDecoration(
//                                 hintText: "Search",
//                                 fillColor: Colors.white,
//                                 filled: true,
//                                 suffixIcon: const Icon(Icons.filter_list),
//                                 enabledBorder: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(20.0),
//                                   borderSide: const BorderSide(
//                                       color: Colors.transparent),
//                                 ),
//                                 contentPadding: const EdgeInsets.symmetric(
//                                     horizontal: 16.0, vertical: 16.0)),
//                           ),
//                         )),
//                   ),
//                   SliverFillRemaining(
//                     child: Center(
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: <Widget>[
//                           const Text(
//                             'You have pushed the button this many times:',
//                           ),
//                           Text(
//                             '',
//                             style: Theme.of(context).textTheme.headlineMedium,
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               )
