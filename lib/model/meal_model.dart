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
