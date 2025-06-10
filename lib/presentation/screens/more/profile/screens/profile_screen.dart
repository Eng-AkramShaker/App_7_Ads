import 'package:app_7/core/constants/app_navigators.dart';
import 'package:app_7/presentation/screens/auth/controller/auth_controller.dart';
import 'package:app_7/presentation/screens/more/profile/screens/edit_profile_screen.dart';
import 'package:app_7/presentation/screens/more/profile/widgets/build_Info_row.dart';
import 'package:flutter/material.dart';
import 'package:app_7/core/constants/ColorManager.dart';
import 'package:provider/provider.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Auth_Controller>(builder: (context, proAuth, child) {
      return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: ColorManager.w_color,
          appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              title: const Text('حسابي', style: TextStyle(color: ColorManager.primary, fontWeight: FontWeight.bold)),
              centerTitle: true),
          body: Directionality(
            textDirection: TextDirection.rtl,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: proAuth.user == null
                  ? Center(child: CircularProgressIndicator())
                  : Column(
                      children: [
                        const SizedBox(height: 70),
                        const CircleAvatar(radius: 60, backgroundImage: AssetImage('assets/images/user.png')),
                        const SizedBox(height: 30),
                        const SizedBox(height: 15),

                        buildInfoRow(icon: Icons.person, label: 'اسم المستخدم', value: proAuth.user!.username),
                        const SizedBox(height: 15),
                        buildInfoRow(
                          icon: Icons.phone,
                          label: 'رقم الهاتف',
                          value: proAuth.user!.phone == "" ? "قم باضافة رقم الهاتف" : proAuth.user!.phone,
                        ),
                        const SizedBox(height: 15),
                        buildInfoRow(icon: Icons.email, label: 'البريد الإلكتروني', value: proAuth.user!.email),

                        const SizedBox(height: 50),

                        //

                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ColorManager.primary,
                            minimumSize: const Size(double.infinity, 45),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          ),
                          onPressed: () {
                            pushNewScreen(context, EditProfileScreen());
                          },
                          icon: const Icon(Icons.edit, color: Colors.white),
                          label: const Text(
                            'تعديل البيانات',
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      ],
                    ),
            ),
          ),
        ),
      );
    });
  }
}

// import 'package:app_7/presentation/screens/more/profile/widgets/points_container.dart';
// import 'package:app_7/presentation/screens/more/profile/widgets/wallet_container.dart';
// import 'package:flutter/material.dart';
// import 'package:app_7/core/constants/ColorManager.dart';

// import '../widgets/profile_header.dart';

// class MyProfile extends StatefulWidget {
//   const MyProfile({super.key});

//   @override
//   State<MyProfile> createState() => _MyProfileState();
// }

// class _MyProfileState extends State<MyProfile> {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.white,
//           title: const Text(
//             'حـسـابـي',
//             style: TextStyle(
//               color: ColorManager.primary,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           centerTitle: true,
//         ),
//         body: Column(
//           children: [
//             Container(
//               decoration: const BoxDecoration(
//                 color: ColorManager.w_color,
//                 borderRadius: BorderRadius.only(
//                   bottomLeft: Radius.circular(40),
//                   bottomRight: Radius.circular(40),
//                 ),
//               ),
//               child: const Padding(
//                 padding: EdgeInsets.only(top: 30),
//                 child: ProfileHeader(),
//               ),
//             ),
//             const SizedBox(height: 40.0),
//             const Padding(
//               padding: EdgeInsets.only(left: 20, right: 20),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   PointsContainer(),
//                   WaletContainer(),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
