import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shayari_posting/Constants/ColorConstants.dart';
import 'package:shayari_posting/Constants/utils.dart';
import 'package:shayari_posting/Controller.dart/categories_controller.dart';
import 'package:shayari_posting/shayari_list_screen.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CategoriesController categoriesController =
        Get.put(CategoriesController());
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Obx(
            () => ListView.builder(
              itemCount: categoriesController.filteredCategories.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Get.to(() => ShayariListScreen(
                        category:
                            categoriesController.categoriesShayari[index]));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      height: 40.h,
                      width: Get.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                          border: Border.all(color: KSecColor)),
                      child: Center(
                          child: CustomizedText(
                              text:
                                  categoriesController.categoriesShayari[index],
                              size: 14.sp,
                              FontWeight: FontWeight.w600,
                              color: Colors.black)),
                    ),
                  ),
                );
              },
            ),
          )),
    );
  }
}
