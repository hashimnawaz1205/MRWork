import 'package:flutter/material.dart';
import '../models/topRecomendations.dart';
import '../services/topRecommendation_services.dart';

class TopRecommendationsProvider extends ChangeNotifier {
  final _service = TopRecommendationsService();
  bool isLoading = false;
  List<TopRecommendations> _topRecommendations = [];
  List<TopRecommendations> get topRecommendations => _topRecommendations;

  Future<void> getAllTopRecommendations() async {
    isLoading = true;
    notifyListeners();

    final response = await _service.getAllTopRecommendations();

    _topRecommendations = response;
    isLoading = false;
    notifyListeners();
  }
}
