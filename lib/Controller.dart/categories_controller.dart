import 'package:get/get.dart';

class CategoriesController extends GetxController {
  // List of Shayari categories
  final RxList<String> categoriesShayari = [
    'Sad Shayari',
    'Love Shayari',
    'Pyar Shayari',
    'Dosti Shayari',
    'Dard Shayari',
    'Independence Day Shayari',
    'Romantic Shayari',
    'Sad Shayari',
    'Love Shayari',
    'Pyar Shayari',
    'Dosti Shayari',
    'Dard Shayari',
    'Independence Day Shayari',
    'Romantic Shayari',
  ].obs;

  RxBool isFavorite = false.obs;
}
