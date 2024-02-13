// ignore_for_file: camel_case_types, non_constant_identifier_names, avoid_print, unused_element

import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../constes/navigators.dart';
import '../screens/home/home_screen.dart';

class Controller_Home extends ChangeNotifier {
  int counter = 0;

  List data_City_json = [];
  List data_Items_json = [];

  //
  void addCounter() {
    counter++;
    notifyListeners();
  }
  // ===================================================================

  city_JsonData(context) async {
    String dd = await DefaultAssetBundle.of(context).loadString('assets/json/city.json');

    for (var i in jsonDecode(dd)) {
      data_City_json.add(i['ar']);
    }
    notifyListeners();
    // print(data_City_json);
  }

  items_JsonData(context) async {
    String dd = await DefaultAssetBundle.of(context).loadString('assets/json/items.json');

    for (var i in jsonDecode(dd)) {
      data_Items_json.add(i['ar']);
    }
    notifyListeners();
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
