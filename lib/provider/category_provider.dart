
import 'package:flutter/foundation.dart';
import 'package:mobile_project/model/category_model.dart';

import '../core/services/api_service.dart';


/// This provider use for Category operations
class CategoryProvider with ChangeNotifier {
  List<CategoryModel> _categories = [];
  bool _isLoading = false;

  List<CategoryModel> get categories => _categories;
  bool get isLoading => _isLoading;

/// Get all the categories from the service
  Future<void> fetchCategories() async {
    _isLoading = true;
    notifyListeners();
    _categories =
        await ApiService().fetchCategories().then((data) => data.map((item) => CategoryModel.fromJson(item)).toList());
    _isLoading = false;
    notifyListeners();
  }
}
