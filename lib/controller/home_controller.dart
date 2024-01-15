// ignore_for_file: camel_case_types, non_constant_identifier_names, avoid_print, unused_element

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../pages/screenes/home.dart';

class Controller_Home extends GetxController {
  RxInt counter = 0.obs;
  void addCounter() {
    counter.value++;
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

  send_code() async {
    try {
      String smsCode = 'xxxx';

      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verif_Id.toString(), smsCode: smsCode);

      await auth.signInWithCredential(credential).then((value) {
        if (value.user != null) {
          Get.to(const Home());
        }
      });
    } catch (e) {
      print('===========================  $e');
    }
  }
}
