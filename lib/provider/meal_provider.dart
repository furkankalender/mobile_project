import 'package:flutter/material.dart';
import 'package:mobile_project/model/meal_model.dart';

import '../core/services/api_service.dart';

/// This provider use for Category operations
class MealProvider with ChangeNotifier {
  List<MealModel> _meals = [];
  bool _isLoading = false;

  List<MealModel> get meals => _meals;
  bool get isLoading => _isLoading;

  /// Get all the categories from the service
  Future<void> fetchMeals(String category) async {
    _isLoading = true;
    notifyListeners();
    _meals = await ApiService().fetchMeals(category).then(
          (data) => data.map((item) => MealModel.fromJson(item)).toList(),
        );
    _isLoading = false;
    notifyListeners();
  }
}
