import 'package:flutter/material.dart';
import 'package:mrworker/AppState/models/searchModel.dart';

import '../services/search_service.dart';

class SearchProvider extends ChangeNotifier {
  final _service = SearchService();
  bool isLoading = false;
  List<SearchModel> _searchModel = [];
  List<SearchModel> get searchModel => _searchModel;

  Future<void> getSearch(String city, String curl) async {
    isLoading = true;
    notifyListeners();

    final response = await _service.getSearch(city, curl);

    _searchModel = response;
    isLoading = false;
    notifyListeners();
  }
}
