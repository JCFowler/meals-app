import 'package:flutter/material.dart';

import 'dummy_data.dart';
import 'models/meal.dart';
import 'models/category.dart';
import 'models/filter_model.dart';
import 'screens/filters_screen.dart';
import 'screens/tabs_screen.dart';
import 'screens/meal_detail_screen.dart';
import 'screens/category_meals_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var filters = Filter(
    isGlutenFree: false,
    isLactoseFree: false,
    isVegan: false,
    isVegetarian: false,
  );

  List<Meal> _avaliableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _setFilters(Filter filter) {
    setState(() {
      filters = filter;

      _avaliableMeals = DUMMY_MEALS.where((meal) {
        if (filters.isGlutenFree && !meal.isGlutenFree) {
          return false;
        }
        if (filters.isLactoseFree && !meal.isLactoseFree) {
          return false;
        }
        if (filters.isVegan && !meal.isVegan) {
          return false;
        }
        if (filters.isVegetarian && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavorites(String mealId) {
    var existingIndex =
        _favoriteMeals.indexWhere((element) => element.id == mealId);

    if (existingIndex != -1) {
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteMeals.add(
          DUMMY_MEALS.firstWhere((element) => element.id == mealId),
        );
      });
    }
  }

  bool isMealFavorite(String mealId) {
    return _favoriteMeals.any((element) => element.id == mealId);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals',
      theme: ThemeData(
        primarySwatch: Colors.red,
        accentColor: Colors.lightBlue,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
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
      ),
      onGenerateRoute: (settings) {
        if (settings.name == '/category_meals') {
          final args = settings.arguments as Category;
          return MaterialPageRoute(
            builder: (context) {
              return CategoryMealsScreen(args, _avaliableMeals);
            },
          );
        }
      },
      routes: {
        '/': (ctx) => TabsScreen(_favoriteMeals),
        // '/category_meals': (ctx) => CategoryMealsScreen(),
        '/meal_detail': (ctx) => MealDetailScreen(
              _toggleFavorites,
              isMealFavorite,
            ),
        '/filters': (ctx) => FiltersScreen(filters, _setFilters)
      },
    );
  }
}
