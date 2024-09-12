import 'dart:math';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tes_mge_ruliandrian/controllers/loginController.dart';
import 'package:tes_mge_ruliandrian/services/helper.dart';

class LoginPageView extends StatelessWidget {
  const LoginPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final loginC = Get.find<LoginController>();
    return Scaffold(
      body:Container(
        child: Stack(
          children: [
            Container(
                width: size(context).width,
                child: Image.asset('assets/login.png',fit: BoxFit.cover,)),
            Align(
              alignment: Alignment.bottomCenter,
              child: Form(
                key: loginC.keyform,
                child: Padding(
                  padding: const EdgeInsets.only(left: 50,right: 50),
                  child: Container(
                    height: 500,
                    child: Column(
                      children: [
                        const Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: FaIcon(FontAwesomeIcons.user,size: 20,),
                            ),
                            Text("Username",style: TextStyle(fontSize: 18),)
                          ],
                        ),
                        TextFormField(
                          controller: loginC.username,
                          validator: (e) {
                            if (e!.isEmpty) {
                              return 'Masukkan Username';
                            }else if(GetStorage().read(STORAGE_USERNAME) != e){
                              return 'Username tidak ditemukan';
                            }
                            return null;
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
                              child: FaIcon(FontAwesomeIcons.key,size: 20,),
                            ),
                            Text("Password",style: TextStyle(fontSize: 18),)
                          ],
                        ),
                        TextFormField(
                            controller: loginC.password,
                            validator: (e) {
                              if (e!.isEmpty) {
                                return 'Masukkan password!';
                              }else if(GetStorage().read(STORAGE_PASSWORD) != e){
                                return 'Password tidak sesuai ';
                              }
                              return null;
                            },
                          obscureText: true,
                            decoration: const InputDecoration(
                              labelText: 'Password ',
                            ),
                          ),

                        Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: Container(
                              height: 50,
                              width: size(context).width /1.5,
                              decoration: const BoxDecoration(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                                color: Colors.blue
                              ),
                              // ignore: deprecated_member_use
                              child: TextButton(
                                onPressed: () {
                                  loginC.validasi();
                                },
                                child: const Text("Submit",
                                    style: TextStyle(color: Colors.white)),
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      )

    );
  }
}
