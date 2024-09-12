import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:tes_mge_ruliandrian/controllers/homeController.dart';
import 'package:tes_mge_ruliandrian/pages/widget.dart';
import 'package:tes_mge_ruliandrian/services/helper.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Obx(
              () => controller.fotoSelfie.value != null
                  ? Container(
                height: 100,
                width: 100,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),

                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black45,
                                blurRadius: 4,
                                spreadRadius: 0.1,
                                offset: Offset(0, 1))
                          ]),
                      child: InkWell(
                          onTap: () => controller.ambilFoto(),
                          child: Container(
                            height: size(context).width / 2,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              image: controller.fotoSelfie.value != null
                                  ? DecorationImage(
                                      image: FileImage(
                                          controller.fotoSelfie.value!),
                                      fit: BoxFit.fill)
                                  : null,
                            ),
                            child: controller.fotoSelfie.value == null
                                ? const Center(
                                    child: FaIcon(FontAwesomeIcons.cameraRetro,
                                        color: Colors.grey, size: 40),
                                  )
                                : null,
                          )),
                    )
                  : InkWell(
                onTap: () => controller.ambilFoto(),
                    child: Container(
                        height: 100,
                        width: 100,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.blue),
                        child:const Center(
                            child: Icon(
                          Icons.supervisor_account_sharp,
                          color: Colors.white,
                          size: 50,
                        )),
                      ),
                  ),
            ),
            Padding(padding: EdgeInsets.all(20)),
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: FaIcon(
                    FontAwesomeIcons.user,
                    size: 20,
                  ),
                ),
                Text(
                  "Username",
                  style: TextStyle(fontSize: 18),
                )
              ],
            ),
            TextFormField(
              controller: controller.username,
              validator: (e) {
                if (e!.isEmpty) {
                  return 'Masukkan Username';
                }
                return null;
              },
              onChanged: (v){
                controller.saveProfile();
              },
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                hintText: 'Username',
              ),
            ),
            Padding(padding: EdgeInsets.all(10)),
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: FaIcon(
                    FontAwesomeIcons.phone,
                    size: 20,
                  ),
                ),
                Text(
                  "Phone",
                  style: TextStyle(fontSize: 18),
                )
              ],
            ),
            TextFormField(
              controller: controller.phone,
              validator: (e) {
                if (e!.isEmpty) {
                  return 'Masukkan Nomor HP!';
                }
                return null;
              },
              onChanged: (v){
                controller.saveProfile();
              },
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                labelText: '+6281-234-5678',
              ),
            ),
            Padding(padding: EdgeInsets.all(10)),
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: FaIcon(
                    FontAwesomeIcons.home,
                    size: 20,
                  ),
                ),
                Text(
                  "Address",
                  style: TextStyle(fontSize: 18),
                )
              ],
            ),
            TextFormField(
              controller: controller.alamat,
              validator: (e) {
                if (e!.isEmpty) {
                  return 'Masukkan Alamat!';
                }
                return null;
              },
              onChanged: (v){
                controller.saveProfile();
              },
              decoration: const InputDecoration(
                labelText: 'Surabaya, Indonesia',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
