import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tes_mge_ruliandrian/controllers/homeController.dart';
import 'package:tes_mge_ruliandrian/pages/widget.dart';
class ListAlbumView extends StatelessWidget {
  const ListAlbumView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return Obx(()=>
       ListView(
        children: List.generate(controller.dataalbum.value.length, (i){
          final data = controller.dataalbum.value;
            if(data.isNotEmpty){
              return ListTile(
                onTap: (){
                  Get.defaultDialog(
                    title: '',
                    contentPadding: EdgeInsets.zero,
                    content: DetailAlbum(url: data[i].url, judul: data[i].title),
                  );
                },
                title: Text(data[i].title),
                isThreeLine: true,
                subtitle: Text('URL : ${data[i].url}'),
                leading: Padding(
                  padding: const EdgeInsets.all(2),
                  child: Image.network(data[i].url),
                ),
                trailing: IconButton(
                  onPressed: (){
                    Get.defaultDialog(
                        title: "Hapus Data",
                        content: Text("Yakin Untuk Hapus Data Ini"),
                        textCancel: "Batal",
                        textConfirm: "Yakin",
                        onConfirm: (){
                          controller.removeAlbumById(data[i].id);
                          Get.back();
                        }
                    );

                  },
                  icon: Icon(Icons.delete),
                ),
              );
            }else{
              return const Center(
                child: Text('Data tidak ditemukan'),
              );
            }
        }),
      ),
    );
  }
}
