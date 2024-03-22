import 'dart:async';

import 'package:get/get.dart';
import 'package:shayari_posting/home_screen.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    // Add your timer logic here
    Timer(const Duration(seconds: 5), () {
      Get.offAll(() => const HomeScreen());
    });
  }
}
