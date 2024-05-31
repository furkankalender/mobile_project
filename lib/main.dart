import 'package:flutter/material.dart';
import 'package:mobile_project/presentation/home_page.dart';
import 'package:mobile_project/provider/category_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CategoryProvider()..fetchCategories(),
        ),
      ],
      child: MaterialApp(
        title: 'Meal Application',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
      ),
    );
  }
}
