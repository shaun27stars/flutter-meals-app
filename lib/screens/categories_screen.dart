import 'package:flutter/material.dart';
import 'package:flutter_meals_app/widgets/category_grid_item.dart';

import '../dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  static const routeName = "/categories";
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GridView(
        padding: const EdgeInsets.all(25),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 1.5,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: DUMMY_CATEGORIES.map((cat) => CategoryGridItem(cat)).toList(),
      ),
    );
  }
}
