import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shayari_posting/Constants/ColorConstants.dart';
import 'package:shayari_posting/Constants/utils.dart';
import 'package:shayari_posting/Controller.dart/splash_controller.dart';
import 'package:shayari_posting/home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SplashController splashController = Get.put(SplashController());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: Transform.scale(
                alignment: Alignment.center,
                scale: 1,
                child: Lottie.asset('assets/ss.json'),
              ),
            ),
            Container(
                margin: const EdgeInsets.only(bottom: 20.0),
                width: Get.width,
                alignment: Alignment.center,
                child: CustomizedText(
                    text: "Powered By Wind Tech",
                    color: Colors.blue,
                    size: 12.sp,
                    FontWeight: FontWeight.bold))
          ],
        ),
      ),
    );
  }
}



// void toggleSelected(int index) {
  //   setState(() {
  //     selectedNumbers[index] = !selectedNumbers[index];
  //   });
  // }