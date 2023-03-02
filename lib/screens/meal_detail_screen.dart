import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = "/meal-detail";
  const MealDetailScreen({super.key});

  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      height: 150,
      width: 300,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    final selectMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: 300,
            width: double.infinity,
            child: Image.network(
              selectMeal.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          buildSectionTitle(context, "Ingredients"),
          buildContainer(
            ListView.builder(
              itemCount: selectMeal.ingredients.length,
              itemBuilder: (context, index) => Card(
                color: Theme.of(context).colorScheme.secondary,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Text(selectMeal.ingredients[index]),
                ),
              ),
            ),
          ),
          buildSectionTitle(context, "Steps"),
          buildContainer(
            ListView.builder(
              itemCount: selectMeal.steps.length,
              itemBuilder: (context, index) => Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      child: Text("# ${(index + 1)}"),
                    ),
                    title: Text(selectMeal.steps[index]),
                  ),
                  const Divider()
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
