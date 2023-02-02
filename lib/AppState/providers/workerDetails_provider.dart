import 'package:flutter/material.dart';
import 'package:mrworker/AppState/models/workerDetails.dart';
import 'package:mrworker/AppState/services/workerDetails_service.dart';
import '../models/topRecomendations.dart';
import '../services/topRecommendation_services.dart';

class WorkerDetailsProvider extends ChangeNotifier {
  final _service = WorkerDetailsService();
  bool isLoading = false;
  List<WorkerDetails> _workerDetails = [];
  List<WorkerDetails> get workerDetails => _workerDetails;

  Future<void> getWorkerDetails(String user_id) async {
    isLoading = true;
    notifyListeners();

    final response = await _service.getWorkerDetails(user_id);

    _workerDetails = response;
    isLoading = false;
    notifyListeners();
  }
}
