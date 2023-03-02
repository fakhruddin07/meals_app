import 'package:flutter/material.dart';
import 'package:meals_app/screens/meal_detail_screen.dart';

import 'screens/categories_screen.dart';
import 'screens/category_meals_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DeliMeals',
      theme: ThemeData(
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink)
            .copyWith(secondary: Colors.amber),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              titleMedium: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: "RobotoCondensed",
              ),
              bodyMedium: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
            ),
      ),
      // home: const CategoriesScreen(),
      routes: {
        "/": (cte) => const CategoriesScreen(),
        CategoryMealsScreen.routeName: (ctx) => const CategoryMealsScreen(),
        MealDetailScreen.routeName: (ctx) => const MealDetailScreen(),
      },
    );
  }
}
