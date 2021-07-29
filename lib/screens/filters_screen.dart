import 'package:flutter/material.dart';
import 'package:flutter_meals_app/widgets/drawer_content.dart';

import 'tabs_screen.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = "/filters";

  final Map<String, bool> currentFilters;
  final Function saveFilters;

  const FiltersScreen(this.currentFilters, this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  initState() {
    super.initState();
    _glutenFree = widget.currentFilters['glutenFree']!;
    _vegetarian = widget.currentFilters['vegetarian']!;
    _vegan = widget.currentFilters['vegan']!;
    _lactoseFree = widget.currentFilters['lactoseFree']!;
  }

  Widget _buildSwitchListTile(
    String title,
    String description,
    bool currentValue,
    void Function(bool) updateValue,
  ) {
    return SwitchListTile.adaptive(
      title: Text(title),
      subtitle: Text(description),
      value: currentValue,
      onChanged: updateValue,
      activeColor: Theme.of(context).primaryColor,
    );
  }

  void saveFilters() {
    widget.saveFilters({
      'glutenFree': _glutenFree,
      'lactoseFree': _lactoseFree,
      'vegan': _vegan,
      'vegetarian': _vegetarian
    });
    Navigator.of(context).pushReplacementNamed(TabsScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Filters"),
        actions: [IconButton(onPressed: saveFilters, icon: Icon(Icons.save))],
      ),
      drawer: Drawer(child: DrawerContent()),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "Adjust your meal selection.",
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildSwitchListTile(
                  "Gluten Free",
                  "Only include gluten-free meals",
                  _glutenFree,
                  (newVal) => setState(() => _glutenFree = newVal),
                ),
                _buildSwitchListTile(
                  "Vegetarian",
                  "Only include vegetarian meals",
                  _vegetarian,
                  (newVal) => setState(() => _vegetarian = newVal),
                ),
                _buildSwitchListTile(
                  "Vegan",
                  "Only include vegan meals",
                  _vegan,
                  (newVal) => setState(() => _vegan = newVal),
                ),
                _buildSwitchListTile(
                  "Lactose Free",
                  "Only include lactose-free meals",
                  _lactoseFree,
                  (newVal) => setState(() => _lactoseFree = newVal),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
