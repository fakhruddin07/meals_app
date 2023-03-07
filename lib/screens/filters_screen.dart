import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = "/filters";
  final Function saveFilters;
  final Map<String, bool> currentFilters;
  const FiltersScreen(this.currentFilters, this.saveFilters, {super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _veganFree = false;
  bool _vegetarianFree = false;
  bool _lactoseFree = false;
  late Function updateValue;

  @override
  void initState() {
    _glutenFree = widget.currentFilters["gluten"]!;
    _lactoseFree = widget.currentFilters["lectose"]!;
    _veganFree = widget.currentFilters["vegan"]!;
    _vegetarianFree = widget.currentFilters["vegetarian"]!;
    super.initState();
  }

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
        actions: [
          IconButton(
            onPressed: () {
              final selectedFilter = {
                "gluten": _glutenFree,
                "lectose": _lactoseFree,
                "vegan": _veganFree,
                "vegetarian": _vegetarianFree,
              };
              widget.saveFilters(selectedFilter);
            },
            icon: const Icon(Icons.save),
          )
        ],
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
              _veganFree,
              (newValue) {
                setState(() {
                  _veganFree = newValue;
                });
              },
            ),
            _buildSwitchListTile(
              "Vegetarian",
              "Only include vegetarian meals.",
              _vegetarianFree,
              (newValue) {
                setState(() {
                  _vegetarianFree = newValue;
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
