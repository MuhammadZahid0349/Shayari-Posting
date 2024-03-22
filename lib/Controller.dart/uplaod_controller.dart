import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shayari_posting/Constants/utils.dart';
import 'package:shayari_posting/Controller.dart/categories_controller.dart';

class UploadPostController extends GetxController {
  final TextEditingController textController = TextEditingController();
  final RxString selectedCategory = 'Sad Shayari'.obs;
  final RxBool showPostDetails = false.obs;

  void clearText() {
    textController.clear();
  }

  void post() {
    try {
      if (textController.text.isNotEmpty) {
        showPostDetails.value = true;
      } else {
        throw Exception("Post text is empty");
      }
    } catch (e) {
      CustomizedSnackBar("Error", e.toString());
    }
  }
}
