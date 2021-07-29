import 'package:flutter/material.dart';
import 'package:flutter_meals_app/models/meal.dart';
import 'package:flutter_meals_app/widgets/meal_list_item.dart';

class FavouritesScreen extends StatelessWidget {
  List<Meal> favouriteMeals;

  FavouritesScreen(this.favouriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favouriteMeals.isEmpty) {
      return Center(
        child: Text(
          'You have no favourites yet - start adding some!',
        ),
      );
    }
    return ListView.builder(
      itemBuilder: (ctx, idx) => MealListItem(meal: favouriteMeals[idx]),
      itemCount: favouriteMeals.length,
    );
  }
}
