import 'package:get/get.dart';

class CategoriesController extends GetxController {
  // List of Shayari categories
  final RxList<String> categoriesShayari = [
    'Sad Shayari',
    'Love Shayari',
    "Friendship Shayari",
    'Dosti Shayari',
    "Motivational Shayari",
    "Life Shayari",
    "Philosophical Shayari",
    'Nature Shayari',
    'Independence Day Shayari',
    'Romantic Shayari',
    'Religious Shayari',
    'Funny Shayari',
  ].obs;

  RxBool isFavoriteImg = false.obs;
  RxBool isFavoriteTxt = false.obs;

  // Observable list to hold filtered categories
  final RxList<String> _filteredCategories = <String>[].obs;

  // Getter to access filtered categories
  List<String> get filteredCategories => _filteredCategories;

  @override
  void onInit() {
    // Initialize filtered categories with all categories initially
    _filteredCategories.assignAll(categoriesShayari);
    super.onInit();
  }

  // Method to filter categories based on search query
  void filterCategories(String query) {
    if (query.isEmpty) {
      // If search query is empty, reset filtered categories to all categories
      _filteredCategories.assignAll(categoriesShayari);
    } else {
      // If search query is not empty, filter categories based on query
      _filteredCategories.assignAll(categoriesShayari.where(
          (category) => category.toLowerCase().contains(query.toLowerCase())));
    }
  }
}
