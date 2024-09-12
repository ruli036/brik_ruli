import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:tes_mge_ruliandrian/connections/apiService.dart';
import 'package:tes_mge_ruliandrian/connections/objectAPI.dart';
import 'package:tes_mge_ruliandrian/pages/widget.dart';
import 'package:tes_mge_ruliandrian/services/helper.dart';

class HomeController extends GetxController {
  final ApiService apiService = ApiService();
  TextEditingController username = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController alamat = TextEditingController();
  final storage = GetStorage();
  RxInt selectedIndex = 0.obs;
  RxBool isLoading = false.obs;
  RxBool isError = false.obs;
  RxList<Album> dataalbum = <Album>[].obs;
  var fotoSelfie = Rx<File?>(null);


  void fetchData() async {
     isLoading.value = true;
     isError.value = false;
    dataalbum.value.clear();
    final response = await apiService.getData('photos');
    print(response.body);
    if (response.status.hasError) {
        Get.snackbar('Error', 'Failed to fetch data ${response.status.code}',backgroundColor: Colors.white);
        isError.value = true;
    } else {
        List<dynamic> rawList = response.body;
        dataalbum.value = rawList.map((item) {
          print(item);
          return Album.fromJson(item);
        }).toList();
        print(dataalbum.value[0].title);
    }
    isLoading.value = false;
  }
  void removeAlbumById(int id) {
    dataalbum.removeWhere((album) => album.id == id);
  }

  ambilFoto() async {
    Get.defaultDialog(
      title: "Ambil Foto",
      barrierDismissible: true,
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
              onPressed: () async {
                Get.back();
                fotoSelfie.value =
                await getImagefromCamera(CropAspectRatioPreset.ratio16x9)
                    .whenComplete(() {
                });
              },
              icon: FaIcon(
                FontAwesomeIcons.camera,
                size: 35,
                color: Colors.grey.shade500,
              )),
          IconButton(
              onPressed: () async {
                Get.back();
                fotoSelfie.value =
                await getImagefromgalery(CropAspectRatioPreset.ratio16x9)
                    .whenComplete(() {
                });
              },
              icon: FaIcon(FontAwesomeIcons.fileImage,
                  size: 35, color: Colors.grey.shade500))
        ],
      ),
      textCancel: "Batal",
      // confirmTextColor: AppColors.textColor,
    );
  }
  saveProfile(){
    storage.write(STORAGE_USERNAME, username.text);
    storage.write(STORAGE_HP, phone.text);
    storage.write(STORAGE_ALAMAT, alamat.text);
    readProfile();
  }

  readProfile(){
    username.text = storage.read(STORAGE_USERNAME)??'';
    phone.text = storage.read(STORAGE_HP)??'';
    alamat.text = storage.read(STORAGE_ALAMAT)??'';
    if(storage.read(STORAGE_FOTO) != null){
      fotoSelfie.value =  File(storage.read(STORAGE_FOTO));
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    readProfile();
  }
}