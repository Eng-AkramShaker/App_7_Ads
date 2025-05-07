// ignore_for_file: camel_case_types, non_constant_identifier_names, avoid_print, unused_element, prefer_typing_uninitialized_variables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:motion_tab_bar/MotionTabBarController.dart';
import '../../../../core/constants/navigators.dart';
import '../screens/home.dart';

class Controller_Home extends ChangeNotifier {
  int counter = 0;

  List data_City_json = [];
  List data_Items_json = [];
  List data_Status_json = [];
  List data_Payment_json = [];

  String? selectedValue;
  String? selectedValue_City;
  String? select_Status;
  String? select_Payment;

  MotionTabBarController? motionTabBarController;

  //
  void addCounter() {
    counter++;
    notifyListeners();
  }
  // ===================================================================

  List city_list = [
    {"ar": "الكل", "en": "Cairo"},
    {"ar": "القاهرة", "en": "Cairo"},
    {"ar": "الجيزة", "en": "Giza"},
    {"ar": "الأسكندرية", "en": "Alexandria"},
    {"ar": "الدقهلية", "en": "Dakahlia"},
    {"ar": "البحر الأحمر", "en": "Red Sea"},
    {"ar": "البحيرة", "en": "Beheira"},
    {"ar": "الفيوم", "en": "Fayoum"},
    {"ar": "الغربية", "en": "Gharbiya"},
    {"ar": "الإسماعلية", "en": "Ismailia"},
    {"ar": "المنوفية", "en": "Menofia"},
    {"ar": "المنيا", "en": "Minya"},
    {"ar": "القليوبية", "en": "Qaliubiya"},
    {"ar": "الوادي الجديد", "en": "New Valley"},
    {"ar": "السويس", "en": "Suez"},
    {"ar": "اسوان", "en": "Aswan"},
    {"ar": "اسيوط", "en": "Assiut"},
    {"ar": "بني سويف", "en": "Beni Suef"},
    {"ar": "بورسعيد", "en": "Port Said"},
    {"ar": "دمياط", "en": "Damietta"},
    {"ar": "الشرقية", "en": "Sharkia"},
    {"ar": "جنوب سيناء", "en": "South Sinai"},
    {"ar": "كفر الشيخ", "en": "Kafr Al sheikh"},
    {"ar": "مطروح", "en": "Matrouh"},
    {"ar": "الأقصر", "en": "Luxor"},
    {"ar": "قنا", "en": "Qena"},
    {"ar": "شمال سيناء", "en": "North Sinai"},
    {"ar": "سوهاج", "en": "Sohag"}
  ];

  city_JsonData(context) async {
    for (var i in city_list) {
      data_City_json.add(i['ar']);
    }
    // print(data_City_json);
  }

  // =========
  List data_Items = [
    {"ar": "الكل", "en": "Cairo"},
    {"ar": "عقارات", "en": "Cairo"},
    {"ar": "اجهزة منزلية", "en": "Giza"},
    {"ar": "اجهزة رياضة", "en": "Dakahlia"},
    {"ar": "سيارات", "en": "Alexandria"},
    {"ar": "موبايلات واكسسوارات", "en": "Red Sea"},
    {"ar": "كمبيوتر ولاب توب", "en": "Beheira"},
    {"ar": "اليكترونيات", "en": "Fayoum"},
    {"ar": "وظائف", "en": "Gharbiya"},
    {"ar": "شريك أو شركاء", "en": "Ismailia"},
    {"ar": "ملابس", "en": "Menofia"},
    {"ar": "مستحضرات تجميل", "en": "Minya"},
    {"ar": "كافيهات", "en": "Qaliubiya"},
    {"ar": "مطاعم", "en": "New Valley"},
    {"ar": "صيدليات", "en": "Suez"},
    {"ar": "عيادات", "en": "Aswan"},
    {"ar": "ادوات مدرسية ومكتبة", "en": "Assiut"},
    {"ar": "فنون", "en": "Beni Suef"},
    {"ar": "اشغال يدوية", "en": "Port Said"},
    {"ar": "حيوانات ومستلزماتها", "en": "Damietta"},
    {"ar": "صناعة", "en": "Sharkia"},
    {"ar": "زراعة وحدائق", "en": "South Sinai"},
    {"ar": "صيانة", "en": "Kafr Al sheikh"},
    {"ar": "خدمات اخري (متنوعة)", "en": "Matrouh"}
  ];

  items_JsonData(context) async {
    for (var i in data_Items) {
      data_Items_json.add(i['ar']);
    }
    // print(data_Items_json);
  }

  // =========
  List data_Status = [
    {"ar": "جديد", "en": "New"},
    {"ar": "مستعمل", "en": ""},
    {"ar": "إستيراد", "en": ""},
  ];

  Status_JsonData(context) async {
    for (var i in data_Status) {
      data_Status_json.add(i['ar']);
    }
    // print(data_Items_json);
  }

  // =========
  List data_Payment = [
    {"ar": "كاش", "en": "New"},
    {"ar": "فسط", "en": ""},
    {"ar": "أخري", "en": ""},
  ];

  Payment_JsonData(context) async {
    for (var i in data_Payment) {
      data_Payment_json.add(i['ar']);
    }
    // print(data_Items_json);
  }
  //------------------------------------------------------------------

  FirebaseAuth auth = FirebaseAuth.instance;

  String? verif_Id;
  String? phoneNumber;

  PhoneAuth() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '$phoneNumber',
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int? resendToken) async {
        //

        verif_Id = verificationId;
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  send_code(context) async {
    try {
      String smsCode = 'xxxx';

      PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verif_Id.toString(), smsCode: smsCode);

      await auth.signInWithCredential(credential).then((value) {
        if (value.user != null) {
          pushNewScreen(context, const Home());
        }
      });
    } catch (e) {
      print('===========================  $e');
    }
  }
}
