import 'package:flutter/material.dart';
import '../models/popularCategories.dart';
import '../services/popularCategory_services.dart';

class PopularCategoriesProvider extends ChangeNotifier {
  final _service = PopularCategoriesService();
  bool isLoading = false;
  List<PopularCategories> _popularCategories = [];
  List<PopularCategories> get popularCategories => _popularCategories;

  Future<void> getAllPopularCategories() async {
    isLoading = true;
    notifyListeners();

    final response = await _service.getAllPopularCategories();

    _popularCategories = response;
    isLoading = false;
    notifyListeners();
  }
}
