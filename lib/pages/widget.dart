import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tes_mge_ruliandrian/services/helper.dart';


class DetailAlbum extends StatelessWidget {
  String judul;
  String url;
  DetailAlbum({required this.url,required this.judul});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          Text(judul,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
          Image.network(url)
        ],
      ),
    );
  }
}



Future<File?> getImagefromCamera(CropAspectRatioPreset rasio) async {
  final ImagePicker picker = ImagePicker();
  final XFile? result = await picker.pickImage(source: ImageSource.camera);
  if (result != null) {
    var fileImage = result.path;
    File imageFile = File(fileImage);
    CroppedFile? cropeImage = await ImageCropper().cropImage(
        sourcePath: imageFile.path,
        compressQuality: 60,
    );
    if (cropeImage == null) {
      return null;
    } else {
      print("--------------------IMAGE RESULT-------------------");
      fileImage = cropeImage.path;
      // var image = await compressImage(File(fileImage), 60);
      GetStorage().write(STORAGE_FOTO, fileImage);
      return File(fileImage);
    }
  } else {
    print("No file selected");
  }
}

Future<File?> getImagefromgalery(CropAspectRatioPreset rasio) async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: FileType.image,
  );
  if (result != null) {
    var fileImage = result.files.single.path;
    File imageFile = File(fileImage!);
    CroppedFile? cropeImage = await ImageCropper().cropImage(
        sourcePath: imageFile.path,
        compressQuality: 60,
        );
    if (cropeImage == null) {
      return null;
    } else {
      print("--------------------IMAGE RESULT-------------------");
      fileImage = cropeImage.path;
      // var image = await compressImage(File(fileImage), 60);
      GetStorage().write(STORAGE_FOTO, fileImage);
      return File(fileImage);

    }
  } else {
    print("No file selected");
  }
}
