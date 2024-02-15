// // Profile =======================================================
//
// // ignore_for_file: use_key_in_widget_constructors, sized_box_for_whitespace
//
// import 'package:flutter/material.dart';
// import '../../widgets/user_activity_info.dart';
// import '../../widgets/user_info_widget.dart';
// import '../../widgets/user_profile_image.dart';
//
// class MyProfile extends StatefulWidget {
//   @override
//   State<MyProfile> createState() => MyProfileState();
// }
//
// class MyProfileState extends State<MyProfile> {
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               buildUserImage(size),
//
//               // * 3 user Name
//               buildUserInfo(),
//
//               //* 4 total no. of posts, followers, following (Row Widget)
//               buildUserActivity(),
//
//               // * 5 follow and message button (Row widget)
//               buildUserEvents(size),
//
//               // *
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Container buildUserEvents(Size size) {
//     return Container(
//         // color: Colors.grey.shade100,
//
//         );
//   }
// }

import 'package:app7ads/constes/ColorManager.dart';
import 'package:app7ads/widgets/info_item.dart';
import 'package:flutter/material.dart';

import '../../widgets/custom_tex2.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: ColorManager.b_69.withOpacity(0.9),
          title: CustomText(
            text: 'حـسـابـي',
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: ColorManager.w_FA,
          ),
        ),
        body: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: ColorManager.b_69.withOpacity(0.9),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40))),
              height: size.height * .4,
              child: Padding(
                padding: const EdgeInsets.only(right: 25),
                child: Column(
                  children: [
                    Row(
                      children: [
                        CustomText(
                          text: 'الاسم :',
                          color: ColorManager.w_color,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        CustomText(
                          text: 'عبدالرحمن محمد عباس',
                          color: ColorManager.w_color,
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 0, top: 20),
                          child: Stack(
                            clipBehavior: Clip.none,
                            alignment: Alignment.bottomRight,
                            children: [
                              CircleAvatar(
                                radius: 65,
                                backgroundColor: ColorManager.w_color,
                                child: CircleAvatar(
                                  radius: 62,
                                  child: Image.asset(
                                    'assets/images/user.png',
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: -12,
                                right: 20,
                                child: CircleAvatar(
                                    backgroundColor:
                                        ColorManager.w_FA.withOpacity(0.9),
                                    child: Icon(
                                      Icons.camera_alt,
                                      color: ColorManager.b_69,
                                    )),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    infoItem(
                      infoKey: 'النوع :',
                      infoValue: 'ذكر',
                    ),
                    infoItem(
                      infoKey: 'السن :',
                      infoValue: '23',
                    ),
                    infoItem(
                      infoKey: 'رقم التليفون :',
                      infoValue: '01146580668',
                    ),
                    infoItem(
                      infoKey: 'الايميل :',
                      infoValue: 'abdelrahman@gamail.com',
                    ),
                    infoItem(
                      infoKey: 'المحافظه والمنطقه :',
                      infoValue: 'القاهره - مدينة نصر',
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20 ,right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      height: size.height * 0.26,
                      width: size.width * 0.35,
                      decoration: BoxDecoration(

                        borderRadius: BorderRadius.circular(30),
                        color: ColorManager.b_69,
                      ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(height: 5,),
                        CustomText(text: 'المحفظه والرصيد :' ,color: ColorManager.w_FA,fontWeight: FontWeight.bold,fontSize: 16,) ,
                        CustomText(text: '87',color: ColorManager.w_FA,fontWeight: FontWeight.bold,fontSize: 38, ) ,
                        CustomText(text: 'جنيها فقط لا غير',color: ColorManager.w_FA,fontWeight: FontWeight.bold,fontSize: 16,) ,
                        SizedBox(height: 5,),


                      ],
                    ),
                  ),
                  Container(
                      height: size.height * 0.26,
                      width: size.width * 0.35,
                      decoration: BoxDecoration(

                        borderRadius: BorderRadius.circular(30),
                        color: ColorManager.b_69,
                      ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(height: 5,),
                        CustomText(text: 'النقاط :' ,color: ColorManager.w_FA,fontWeight: FontWeight.bold,fontSize: 16,) ,
                        CustomText(text: '15',color: ColorManager.w_FA,fontWeight: FontWeight.bold,fontSize: 38, ) ,
                        CustomText(text: 'نقطه فقط',color: ColorManager.w_FA,fontWeight: FontWeight.bold,fontSize: 16,) ,
                        SizedBox(height: 5,),


                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
