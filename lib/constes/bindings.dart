// ignore_for_file: unnecessary_import

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

import '../controller/home_controller.dart';

class InitialBindings extends Bindings {
  @override
  dependencies() async {
    Get.put(Controller_Home());
    //  Get.put(Controller_Home());
  }
}
