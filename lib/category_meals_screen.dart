import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  // final String categoryId;
  // final String categoryTitle;
  static const routeName = "/category-meals";
  const CategoryMealsScreen(
      /*this.categoryId, this.categoryTitle, */ {super.key});

  @override
  Widget build(BuildContext context) {
    final routeArg =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final categoryTitle = routeArg["title"];
    final categoryId = routeArg["id"];
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      body: ListView.builder(
        itemCount: categoryMeals.length,
        itemBuilder: (context, index) {
          return Text(categoryMeals[index].title);
        },
      ),
    );
  }
}
