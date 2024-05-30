import 'package:flutter/material.dart';
import 'package:mobile_project/presentation/home_detail_page.dart';
import 'package:provider/provider.dart';

import '../provider/category_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
      ),
      body: Consumer<CategoryProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            itemCount: provider.categories.length,
            itemBuilder: (context, index) {
              final category = provider.categories[index];
              return ListTile(
                leading: Hero(
                  tag: category.thumbnail,
                  child: Image.network(category.thumbnail),
                ),
                title: Text(category.name),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeDetailPage(category: category),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
