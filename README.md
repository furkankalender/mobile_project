## Mobile Meal Application

- Projemiz bu gün ne yapsam ki acaba diye düşünen insanlar için önce kategori sonrasında seçilen kategoriye ait yemekleri getiren bir küçük el kitabıdır.

# Servis Kullanımı

- Servis kullanımı için Rest Api ve http flutter package kullanılmıştır.
  Örnek kullanımı aşağıda bulabilirsiniz.

```dart
final class ApiService {
  Future<List<dynamic>> fetchMeals(String category) async {
    final response = await http.get(Uri.parse('$baseUrl/filter.php?c=$category'));
    if (response.statusCode == 200) {
      return json.decode(response.body)['meals'];
    } else {
      throw Exception('Failed to load meals');
    }
  }
}
```

# Model Kullanımı

- Servisten gelen ui tarafında kullanılabilmesi için modele ihtiyacı vardı.
  Projedeki örnek model kullanımı.

```dart

class MealModel {
  final String id;
  final String name;
  final String thumbnail;

  MealModel({required this.id, required this.name, required this.thumbnail});

  factory MealModel.fromJson(Map<String, dynamic> json) {
    return MealModel(
      id: json['idMeal'],
      name: json['strMeal'],
      thumbnail: json['strMealThumb'],
    );
  }
}

```

# State Management Kullanımı

- State management için Provider tercih edilmiştir. Sebebi ise çok detaylı operasyonların projede yapılmayışından dolayı kolaylık açısından kullanılmıştır.
  Örnek kullanım aşağıdaki gibidir.

```dart

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


```
