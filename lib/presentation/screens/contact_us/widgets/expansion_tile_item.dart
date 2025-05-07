// ignore_for_file: must_be_immutable, deprecated_member_use

import 'package:app_7/model/contact_us.dart';
import 'package:app_7/presentation/widgets/custom_tex2.dart';
import 'package:app_7/core/constants/ColorManager.dart';
import 'package:flutter/material.dart';

class ExpansionTileSubjectItem extends StatelessWidget {
  const ExpansionTileSubjectItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 20,
                blurRadius: 20,
                offset: const Offset(0, 3),
              ),
            ],
            borderRadius: BorderRadius.circular(11),
            color: ColorManager.primary,
          ),
          child: ExpansionTile(
            trailing: const Icon(
              Icons.arrow_drop_down,
              color: Colors.white,
              size: 30,
            ),
            title: const CustomText(
              text: 'الشروط والاحكام',
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return CustomText(
                      text: items[index],
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                      color: Colors.white,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// // ignore_for_file: must_be_immutable

// import 'package:app_7/data/model/contact_us.dart';
// import 'package:app_7/presentation/widgets.dart/custom_tex2.dart';
// import 'package:app_7/utils/constants/ColorManager.dart';
// import 'package:flutter/material.dart';

// class ExpansionTileSubjectItem extends StatelessWidget {
//   const ExpansionTileSubjectItem({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Directionality(
//       textDirection: TextDirection.rtl,
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//         child: ExpansionTile(
//           trailing: const Icon(Icons.arrow_drop_down, color: Colors.white, size: 30),
//           backgroundColor: ColorManager.primary,
//           title: const CustomText(text: 'الشروط والاحكام', color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
//           children: [
//             ListView.builder(
//               physics: const NeverScrollableScrollPhysics(),
//               scrollDirection: Axis.vertical,
//               shrinkWrap: true,
//               itemCount: items.length,
//               itemBuilder: (context, index) {
//                 return CustomText(
//                   text: items[index],
//                   fontWeight: FontWeight.w600,
//                   fontSize: 15,
//                   color: Colors.white,
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
