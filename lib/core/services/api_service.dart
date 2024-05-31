import 'dart:convert';
import 'package:http/http.dart' as http;

/// All repository operations are getting in this Class
class ApiService {
  static const String baseUrl = 'https://www.themealdb.com/api/json/v1/1';

  ///Get All Categories from Service
  Future<List<dynamic>> fetchCategories() async {
    final response = await http.get(Uri.parse('$baseUrl/categories.php'));
    if (response.statusCode == 200) {
      return json.decode(response.body)['categories'];
    } else {
      throw Exception('Failed to load categories');
    }
  }

  ///Get All Meals from Service
  Future<List<dynamic>> fetchMeals(String category) async {
    final response = await http.get(Uri.parse('$baseUrl/filter.php?c=$category'));
    if (response.statusCode == 200) {
      return json.decode(response.body)['meals'];
    } else {
      throw Exception('Failed to load meals');
    }
  }
}
