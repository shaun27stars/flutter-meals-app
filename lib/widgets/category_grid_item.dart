import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import '../screens/category_meals_screen.dart';
import '../models/category.dart';

class CategoryGridItem extends StatelessWidget {
  final Category category;

  const CategoryGridItem(this.category);

  void selectCategory(BuildContext context, Category category) {
    // Without named routes
    // Navigator.of(context).push(
    //   platformPageRoute(
    //     context: context,
    //     builder: (_) => CategoryMealsScreen(category),
    //   ),
    // );
    Navigator.of(context).pushNamed(CategoryMealsScreen.routeName,
        arguments: {"category": category});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => selectCategory(context, category),
      // splashColor: Theme.of(context).primaryColor,
      // borderRadius: BorderRadius.circular(15),

      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.7),
              category.color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        padding: const EdgeInsets.all(15),
        child:
            Text(category.title, style: Theme.of(context).textTheme.headline6),
      ),
    );
  }
}
