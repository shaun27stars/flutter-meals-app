import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meals_app/screens/meal_detail_screen.dart';
import '../models/meal.dart';
import 'text_with_icon.dart';

class MealListItem extends StatelessWidget {
  final Meal meal;

  const MealListItem({Key? key, required this.meal}) : super(key: key);

  void selectMeal(context) {
    Navigator.of(context).pushNamed(MealDetailScreen.routeName, arguments: {
      "meal": meal,
    });
  }

  @override
  Widget build(BuildContext context) {
    // return Container(child: Text(meal.title));

    return GestureDetector(
      onTap: () => selectMeal(context),
      child: Card(
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                // ClipRRect(borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15),),)
                Image.network(meal.imageUrl,
                    height: 250, width: double.infinity, fit: BoxFit.cover),
                Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(0, 0, 0, 0.6),
                  ),
                  child: Text(
                    meal.title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                    ),
                    textAlign: TextAlign.center,
                    softWrap: true,
                    overflow: TextOverflow.fade,
                  ),
                ),
              ],
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
          ],
        ),
      ),
    );
  }
}
