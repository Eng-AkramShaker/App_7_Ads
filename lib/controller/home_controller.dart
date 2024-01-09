// ignore_for_file: camel_case_types

import 'package:get/get.dart';

class Controller_Home extends GetxController {
  RxInt counter = 0.obs;
  void addCounter() {
    counter.value++;
  }
}
