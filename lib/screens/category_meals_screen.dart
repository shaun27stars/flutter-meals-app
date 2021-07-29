import 'package:flutter/material.dart';
import 'package:flutter_meals_app/models/meal.dart';
import '../widgets/meal_list_item.dart';
import '../models/category.dart';

class CategoryMealsScreen extends StatelessWidget {
  // if not using named routes, we pass arguments as normal
  // final Category category;
  // const CategoryMealsScreen(this.category);

  static const routeName = "/category-meals";

  final List<Meal> availableMeals;

  const CategoryMealsScreen(this.availableMeals);

  @override
  Widget build(BuildContext context) {
    // if using named routes, we pull the arguments out
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, Object>;
    final category = routeArgs['category'] as Category;
    final categoryMeals = availableMeals.where((meal) {
      return meal.categoryIds.contains(category.id);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, idx) => MealListItem(meal: categoryMeals[idx]),
        itemCount: categoryMeals.length,
      ),
    );
  }
}
