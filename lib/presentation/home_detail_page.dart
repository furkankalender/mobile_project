import 'package:flutter/material.dart';
import 'package:mobile_project/model/category_model.dart';

import '../core/services/api_service.dart';
import '../model/meal_model.dart';

class HomeDetailPage extends StatelessWidget {
  final CategoryModel category;

  const HomeDetailPage({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category.name),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: ApiService().fetchMeals(category.name),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          return ListView.builder(
            itemCount: snapshot.data?.length ?? 0,
            itemBuilder: (context, index) {
              final meal = MealModel.fromJson(snapshot.data![index]);
              return ListTile(
                leading: Hero(
                  tag: meal.thumbnail,
                  child: Image.network(meal.thumbnail),
                ),
                title: Text(meal.name),
              );
            },
          );
        },
      ),
    );
  }
}
