import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = "/filters";
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegan = false;
  bool _vegetarian = false;
  bool _lactoseFree = false;
  late Function updateValue;

  Widget _buildSwitchListTile(
    String title,
    String description,
    bool currentValue,
    updateValue,
  ) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(description),
      value: currentValue,
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Filters"),
      ),
      drawer: const MainDrawer(),
      body: Column(children: [
        Container(
          padding: const EdgeInsets.all(20),
          child: Text(
            "Adjust your meal selection",
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        Expanded(
          child: ListView(children: [
            _buildSwitchListTile(
              "Gluten-Free",
              "Only include gluten-free meals.",
              _glutenFree,
              (newValue) {
                setState(() {
                  _glutenFree = newValue;
                });
              },
            ),
            _buildSwitchListTile(
              "Vegan",
              "Only include vegan meals.",
              _vegan,
              (newValue) {
                setState(() {
                  _vegan = newValue;
                });
              },
            ),
            _buildSwitchListTile(
              "Vegetarian",
              "Only include vegetarian meals.",
              _vegetarian,
              (newValue) {
                setState(() {
                  _vegetarian = newValue;
                });
              },
            ),
            _buildSwitchListTile(
              "Lactose-Free",
              "Only include lactose-free meals.",
              _lactoseFree,
              (newValue) {
                setState(() {
                  _lactoseFree = newValue;
                });
              },
            ),
          ]),
        )
      ]),
    );
  }
}