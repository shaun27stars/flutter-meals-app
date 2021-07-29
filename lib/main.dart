import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'models/meal.dart';
import 'screens/tabs_screen.dart';
import 'screens/filters_screen.dart';
import 'screens/category_meals_screen.dart';
import 'screens/meal_detail_screen.dart';

import './dummy_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  final themeData = ThemeData(
    primarySwatch: Colors.pink,
    accentColor: Colors.amber,
    canvasColor: Color.fromRGBO(255, 254, 229, 1),
    fontFamily: 'Raleway',
    iconTheme: IconThemeData(color: Colors.pink),
    appBarTheme: AppBarTheme(
      backgroundColor: Platform.isIOS ? Colors.white : null,
    ),
    primaryIconTheme: IconThemeData(
      color: Platform.isIOS ? Colors.pink : Colors.white,
    ),
    primaryTextTheme: TextTheme(
      headline6: TextStyle(
        color: Platform.isIOS ? Colors.pink : null,
      ),
    ),
    textTheme: ThemeData.light().textTheme.copyWith(
          bodyText1: TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1),
          ),
          bodyText2: TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1),
          ),
          headline6: TextStyle(
            fontSize: 20,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold,
          ),
        ),
  );

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _filters = {
    'glutenFree': false,
    'lactoseFree': false,
    'vegan': false,
    'vegetarian': false,
  };
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favouriteMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['glutenFree']! && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactoseFree']! && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan']! && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian']! && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  bool _isMealFavourite(Meal meal) {
    return _favouriteMeals.contains(meal);
    // return _favouriteMeals.any((meal) => meal.id == id);
  }

  void _toggleFavourite(Meal meal) {
    setState(() {
      if (!_favouriteMeals.remove(meal)) {
        _favouriteMeals.add(meal);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Meals App',
      home: TabsScreen(_favouriteMeals),
      theme: widget.themeData,
      routes: {
        CategoryMealsScreen.routeName: (ctx) =>
            CategoryMealsScreen(_availableMeals),
        MealDetailScreen.routeName: (ctx) =>
            MealDetailScreen(_toggleFavourite, _isMealFavourite),
        FiltersScreen.routeName: (ctx) => FiltersScreen(_filters, _setFilters),
      },
    );
  }
}
