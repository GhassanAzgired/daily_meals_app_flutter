import 'package:flutter/material.dart';

import '../items/meal_item.dart';
import '../models/meal.dart';

class MealsPage extends StatefulWidget {
  static const routeName = '/MealsPage';

  final List<Meal> meals;
  // final String catId;
  // final String catTitle;
  const MealsPage({
    Key? key,
    required this.meals,
    // required this.catId,
    // required this.catTitle,
  }) : super(key: key);

  @override
  State<MealsPage> createState() => _MealsPageState();
}

class _MealsPageState extends State<MealsPage> {
  late String catTitle;
  late List<Meal> filteredMeals;

  var _isTrue = false;

  @override
  void didChangeDependencies() {
    if (!_isTrue) {
      final routeArgs =
          ModalRoute.of(context)!.settings.arguments as Map<String, String>;
      catTitle = routeArgs['title'] as String;
      final catId = routeArgs['id'];
      filteredMeals = widget.meals.where((meal) {
        return meal.categories.contains(catId);
      }).toList();
      _isTrue = true;
    }
    super.didChangeDependencies();
  }

  // void _removeItem(String mealId) {
  //   setState(() {
  //     filteredMeals.removeWhere((meal) => meal.id == mealId);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          catTitle,
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: filteredMeals[index].id,
            title: filteredMeals[index].title,
            imageUrl: filteredMeals[index].imageUrl,
            complexity: filteredMeals[index].complexity,
            affordability: filteredMeals[index].affordability,
            duration: filteredMeals[index].duration,
          );
        },
        itemCount: filteredMeals.length,
      ),
    );
  }
}
