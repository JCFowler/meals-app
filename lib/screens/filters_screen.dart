import 'package:flutter/material.dart';

import '../models/filter_model.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  final Filter initalFilters;
  final Function(Filter filter) setFilters;

  FiltersScreen(this.initalFilters, this.setFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  Widget _buildSwitches(
      String title, bool currentValue, Function(bool val) updateValue) {
    return SwitchListTile.adaptive(
      title: Text(title),
      value: currentValue,
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: [
          IconButton(
              onPressed: () {
                widget.setFilters(widget.initalFilters);
              },
              icon: Icon(Icons.save)),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection.',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              _buildSwitches(
                'Gluten Free',
                widget.initalFilters.isGlutenFree,
                (bool value) {
                  setState(() {
                    widget.initalFilters.isGlutenFree = value;
                  });
                },
              ),
              _buildSwitches(
                'Lactose Free',
                widget.initalFilters.isLactoseFree,
                (bool value) {
                  setState(() {
                    widget.initalFilters.isLactoseFree = value;
                  });
                },
              ),
              _buildSwitches(
                'Vegan',
                widget.initalFilters.isVegan,
                (bool value) {
                  setState(() {
                    widget.initalFilters.isVegan = value;
                  });
                },
              ),
              _buildSwitches(
                'Vegetarian',
                widget.initalFilters.isVegetarian,
                (bool value) {
                  setState(() {
                    widget.initalFilters.isVegetarian = value;
                  });
                },
              ),
            ],
          ))
        ],
      ),
    );
  }
}
