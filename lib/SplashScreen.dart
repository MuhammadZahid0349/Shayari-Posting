import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shayari_posting/Constants/ColorConstants.dart';
import 'package:shayari_posting/Constants/utils.dart';
import 'package:shayari_posting/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      Get.offAll(() =>  HomeScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
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