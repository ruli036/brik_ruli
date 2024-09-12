
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tes_mge_ruliandrian/controllers/splashScreenController.dart';
import 'package:tes_mge_ruliandrian/services/helper.dart';


class SplasScreenView extends StatelessWidget {
  const SplasScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SplasScreenController>();
    return Scaffold(
        body: SafeArea(
      child: Align(
        alignment: Alignment.center,
        child: Container(
          height: size(context).height,
          child:const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Text('LOADING')
              ),
              const CircularProgressIndicator()
            ],
          ),
        ),
      ),
    ));
  }
}
