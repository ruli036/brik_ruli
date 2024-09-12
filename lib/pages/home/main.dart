import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:tes_mge_ruliandrian/controllers/homeController.dart';
import 'package:tes_mge_ruliandrian/pages/home/listAlbum.dart';
import 'package:tes_mge_ruliandrian/pages/home/profile.dart';
import 'package:tes_mge_ruliandrian/services/helper.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: false,
        title: Text(
          'Welcome, ${controller.storage.read(STORAGE_NAMA) ?? "Ruli Andrian"}',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
              onPressed: () {
                SystemNavigator.pop();
              },
              icon:const Icon(
                Icons.logout,
                color: Colors.white,
              ))
        ],
      ),
      floatingActionButton: Obx(
        () => controller.selectedIndex.value == 0
            ? FloatingActionButton(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                onPressed: () {
                  controller.fetchData();
                },
                child: const Icon(
                  Icons.download_rounded,
                  color: Colors.white,
                  size: 30,
                ),
              )
            : Container(),
      ),
      bottomNavigationBar: Obx(
        () => BottomAppBar(
            shape: const CircularNotchedRectangle(),
            notchMargin: 10,
            color: Colors.blue,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: FaIcon(
                    FontAwesomeIcons.list,
                    color: controller.selectedIndex == 0
                        ? Colors.white
                        : Colors.grey.shade300,
                    size: controller.selectedIndex == 0 ? 25 : null,
                  ),
                  tooltip: "Home",
                  onPressed: () {
                    controller.selectedIndex.value = 0;
                  },
                ),
                IconButton(
                  icon: FaIcon(
                    FontAwesomeIcons.user,
                    color: controller.selectedIndex == 1
                        ? Colors.white
                        : Colors.grey.shade300,
                    size: controller.selectedIndex == 1 ? 25 : null,
                  ),
                  tooltip: "Setting",
                  onPressed: () {
                    controller.selectedIndex.value = 1;
                  },
                ),
              ],
            )),
      ),
      body: Obx(() {
        if (controller.isLoading.value == true) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (controller.isError.value == true) {
          return const Center(
            child: Text('Server Bermasalah'),
          );
        } else {
          return controller.selectedIndex.value == 0
              ? const ListAlbumView()
              : const ProfileView();
        }
      }),
    );
  }
}
