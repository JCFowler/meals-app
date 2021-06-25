import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';

import '../widgets/meal_item.dart';
import '../models/category.dart';

class CategoryMealsScreen extends StatefulWidget {
  final Category category;
  final List<Meal> avaliableMeals;

  CategoryMealsScreen(this.category, this.avaliableMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  late List<Meal> displayedMeals;
  var loadedData = false;

  @override
  void initState() {
    super.initState();
    displayedMeals = widget.avaliableMeals.where((meal) {
      return meal.categories.contains(widget.category.id);
    }).toList();
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
          return MealItem(displayedMeals[index]);
        },
      ),
    );
  }
}
