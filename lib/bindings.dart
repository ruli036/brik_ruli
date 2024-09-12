import 'dart:developer';

import 'package:get/get.dart';
import 'package:tes_mge_ruliandrian/controllers/homeController.dart';
import 'package:tes_mge_ruliandrian/controllers/loginController.dart';
import 'package:tes_mge_ruliandrian/controllers/splashScreenController.dart';


class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}
class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplasScreenController());
  }
}
class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}