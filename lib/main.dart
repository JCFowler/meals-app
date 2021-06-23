import 'package:flutter/material.dart';

import 'models/category.dart';
import 'screens/filters_screen.dart';
import 'screens/tabs_screen.dart';
import 'screens/meal_detail_screen.dart';
import 'screens/category_meals_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
              return CategoryMealsScreen(args);
            },
          );
        }
      },
      routes: {
        '/': (ctx) => TabsScreen(),
        // '/category_meals': (ctx) => CategoryMealsScreen(),
        '/meal_detail': (ctx) => MealDetailScreen(),
        '/filters': (ctx) => FiltersScreen()
      },
    );
  }
}
