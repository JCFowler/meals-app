import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';

import '../widgets/meal_item.dart';
import '../dummy_data.dart';
import '../models/category.dart';

class CategoryMealsScreen extends StatefulWidget {
  final Category category;

  CategoryMealsScreen(this.category);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  late List<Meal> displayedMeals;
  var loadedData = false;

  @override
  void initState() {
    super.initState();
    displayedMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(widget.category.id);
    }).toList();
  }

  void _removeItem(String mealId) {
    setState(() {
      displayedMeals.removeWhere((element) => element.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category.title),
      ),
      body: ListView.builder(
        itemCount: displayedMeals.length,
        itemBuilder: (ctx, index) {
          return MealItem(displayedMeals[index], _removeItem);
        },
      ),
    );
  }
}
