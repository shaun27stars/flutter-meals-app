import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_meals_app/models/meal.dart';
import 'package:flutter_meals_app/screens/categories_screen.dart';
import 'package:flutter_meals_app/screens/favourites_screen.dart';
import 'package:flutter_meals_app/widgets/drawer_content.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import 'category_meals_screen.dart';
import 'meal_detail_screen.dart';

class TabsScreen extends StatefulWidget {
  static const routeName = "/"; // is home screen

  final List<Meal> favouriteMeals;

  const TabsScreen(this.favouriteMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  var _selectedTabIndex = 0;

  // final routes = {
  //   "/": (ctx) => CategoriesScreen(),
  //   CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(),
  //   MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
  // };

  late List<Map<String, Object>> _pages;

  @override
  initState() {
    super.initState();
    _pages = [
      {
        "title": "Meal Categories",
        "page": CategoriesScreen(),
        // Navigator(
        //   onGenerateRoute: (routeSettings) {
        //     print(routeSettings.name);
        //     return MaterialPageRoute(builder: routes[routeSettings.name]!);
        //   },
        // ),
      },
      {
        "title": "Favourites",
        "page": FavouritesScreen(widget.favouriteMeals),
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedTabIndex]["title"] as String),
      ),
      body: _pages[_selectedTabIndex]["page"] as Widget,
      drawer: Drawer(child: DrawerContent()),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor:
            Platform.isIOS ? Colors.white : Theme.of(context).primaryColor,
        unselectedItemColor:
            Platform.isIOS ? Colors.grey.shade600 : Colors.white,
        selectedItemColor: Platform.isIOS
            ? Theme.of(context).primaryColor
            : Theme.of(context).accentColor,
        currentIndex: _selectedTabIndex,
        onTap: (index) => setState(
          () {
            _selectedTabIndex = index;
          },
        ),
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.category,
            ),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.star,
            ),
            label: "Favourites",
          ),
        ],
      ),
    );
  }
}
