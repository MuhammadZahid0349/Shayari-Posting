import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shayari_posting/Constants/ColorConstants.dart';
import 'package:shayari_posting/SplashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Shayari App',
            theme: ThemeData(
              primaryColor: const Color(0xFF316395),
              appBarTheme: const AppBarTheme(
                backgroundColor: logoColor,
              ),
            ),
            builder: EasyLoading.init(),
            home: const SplashScreen(),
          );
        });
  }
}
