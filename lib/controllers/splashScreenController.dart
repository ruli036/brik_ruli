import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tes_mge_ruliandrian/services/helper.dart';


class SplasScreenController extends GetxController {
  String app_version = '1.5.1';
  String app_version_db = '';
  String link = 'https://play.google.com/store/apps/details?id=com.usyiah.e_tikbroh_yok&hl=en-ID';
  String Authorization = '';
  bool status_login = false;
  final storage = GetStorage();

  void timer() {
    Timer(const Duration(seconds: 1), () {

        Get.offAllNamed('/login');

    });
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    if(storage.read(STORAGE_USERNAME) == null){
      storage.write(STORAGE_USERNAME, 'ruliandrian');
      storage.write(STORAGE_PASSWORD, '123456');
    }

    timer();

}
}
