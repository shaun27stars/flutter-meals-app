import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meals_app/widgets/text_with_icon.dart';
import '../models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';

  final Function toggleFavourite;
  final Function isFavourite;

  MealDetailScreen(this.toggleFavourite, this.isFavourite);

  Widget listBuilder(BuildContext context, String title, List<String> items) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 5),
            child: Text(
              title,
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          for (var item in items)
            Container(
              padding: EdgeInsets.symmetric(vertical: 2),
              child: Text("\u2022 $item"),
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, Object>;
    final meal = routeArgs['meal'] as Meal;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          meal.title,
        ),
        actions: [
          IconButton(
              onPressed: () => toggleFavourite(meal),
              icon: Icon(isFavourite(meal) ? Icons.star : Icons.star_border))
        ],
      ),
      body: Container(
        child: ListView(
          children: [
            Image.network(
              meal.imageUrl,
              height: 250,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWithIcon(
                    text: "${meal.duration}m",
                    icon: Icons.schedule,
                  ),
                  TextWithIcon(
                    text: describeEnum(meal.complexity),
                    icon: Icons.work,
                  ),
                  TextWithIcon(
                    text: describeEnum(meal.affordability),
                    icon: Icons.money,
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Wrap(
                spacing: 10,
                children: [
                  if (meal.isGlutenFree)
                    TextWithIcon(
                      text: "Gluten Free",
                      icon: Icons.check_circle_outline,
                    ),
                  if (meal.isVegan)
                    TextWithIcon(
                      text: "Vegan",
                      icon: Icons.check_circle_outline,
                    ),
                  if (meal.isVegetarian)
                    TextWithIcon(
                      text: "Vegetarian",
                      icon: Icons.check_circle_outline,
                    ),
                  if (meal.isLactoseFree)
                    TextWithIcon(
                      text: "Lactose Free",
                      icon: Icons.check_circle_outline,
                    ),
                ],
              ),
            ),
            listBuilder(context, "Ingredients", meal.ingredients),
            listBuilder(context, "Steps", meal.steps),
          ],
        ),
      ),
    );
  }
}
