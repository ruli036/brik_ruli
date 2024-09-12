import 'package:get/get.dart';
import 'package:tes_mge_ruliandrian/bindings.dart';
import 'package:tes_mge_ruliandrian/pages/home/main.dart';
import 'package:tes_mge_ruliandrian/pages/login/main.dart';
import 'package:tes_mge_ruliandrian/pages/splashScreenView.dart';


final List<GetPage<dynamic>> route = [
  GetPage(
      name: '/splas',
      page: () => const SplasScreenView(),
      binding: SplashBinding()
  ),
  GetPage(
      name: '/login',
      page: () => const LoginPageView(),
      binding: LoginBinding()),
  GetPage(
      name: '/home',
      page: () => const HomePageView(),
      binding: HomeBinding()),
];
