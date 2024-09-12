import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tes_mge_ruliandrian/connections/apiService.dart';
import 'package:tes_mge_ruliandrian/services/helper.dart';

class LoginController extends GetxController {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  final storage = GetStorage();
  final keyform = GlobalKey<FormState>();

  validasi() {
    final form = keyform.currentState;
    print(storage.read(STORAGE_PASSWORD));
    if (form!.validate()) {
        Get.toNamed('/home');
    }
  }


}