import 'package:flutter/material.dart';

import '../widgets/icon_label.dart';
import '../models/meal.dart';

class MealItem extends StatelessWidget {
  final Meal meal;
  final Function removeItem;

  MealItem(this.meal, this.removeItem);

  void mealSelected(BuildContext context) {
    Navigator.of(context).pushNamed(
      '/meal_detail',
      arguments: {'meal': meal},
    ).then(
      (value) => {
        if (value != null) {removeItem(value)},
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => mealSelected(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    meal.imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 320,
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 20,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.black38,
                    ),
                    child: Text(
                      meal.title,
                      textAlign: TextAlign.end,
                      style: TextStyle(fontSize: 26, color: Colors.white),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconLabel(
                    '${meal.duration} min',
                    Icons.schedule,
                  ),
                  IconLabel(
                    meal.complexity.toString().split('.').last,
                    Icons.work,
                  ),
                  IconLabel(
                    meal.affordability.toString().split('.').last,
                    Icons.attach_money,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
