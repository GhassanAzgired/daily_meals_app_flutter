import 'package:flutter/material.dart';

import './dummy_data.dart';
import './screens/filters_page.dart';
import './screens/tabs_page.dart';
import './screens/meal_details_page.dart';
import './screens/categories_page.dart';
import 'screens/meals_page.dart';
import './models/meal.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filteredMealsMap = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _filteredMeals = dummyMeals;
  final List<Meal> _favoriteMealsList = [];

  void _favoriteMeals(String mealId) {
    final _exstingIndex =
        _favoriteMealsList.indexWhere((meal) => meal.id == mealId);
    if (_exstingIndex >= 0) {
      setState(() {
        _favoriteMealsList.removeAt(_exstingIndex);
      });
    } else {
      setState(() {
        _favoriteMealsList.add(
          dummyMeals.firstWhere((meal) => meal.id == mealId),
        );
      });
    }
  }

  bool _isMealFavorite(String mealId) {
    return _favoriteMealsList.any((meal) => meal.id == mealId);
  }

  void _filtered(Map<String, bool> filterData) {
    _filteredMealsMap = filterData;

    setState(() {
      _filteredMeals = dummyMeals.where((meal) {
        if (_filteredMealsMap['gluten'] == true && meal.isGlutenFree == false) {
          return false;
        }
        if (_filteredMealsMap['lactose'] == true &&
            meal.isLactoseFree == false) {
          return false;
        }
        if (_filteredMealsMap['vegan'] == true && meal.isVegan == false) {
          return false;
        }
        if (_filteredMealsMap['vegetarian'] == true &&
            meal.isVegetarian == false) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        iconTheme: const IconThemeData(
          color: Color(0xff181211),
        ),
        colorScheme: const ColorScheme.light().copyWith(
          primary: const Color(0xffBF4342),
          primaryContainer: const Color(0xff8C1C13),
          secondary: const Color(0xffA78A7F),
          secondaryContainer: const Color(0xff735751),
        ),
        canvasColor: const Color(0xffEEE3D3),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              headline1: const TextStyle(
                fontSize: 22,
                fontFamily: 'Raleway',
                color: Colors.white,
              ),
              headline2: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                fontFamily: 'RobotoCondensed',
                color: Color(0xff0C0908),
              ),
              bodyText1: const TextStyle(
                color: Color(0xff735751),
                fontSize: 10,
              ),
              bodyText2: const TextStyle(
                color: Color(0xff735751),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
      ),
      title: 'Daily Meals',
      // home: const CategoriesPage(),
      initialRoute: '/', //default route

      routes: {
        '/': (_) => TabsPage(
              favoriteMeals: _favoriteMealsList,
            ), //home page other notation
        MealsPage.routeName: (_) => MealsPage(meals: _filteredMeals),
        MealDetailsPage.routeName: (_) => MealDetailsPage(
              favoriteMeals: _favoriteMeals,
              isMealFavorite: _isMealFavorite,
            ),
        FiltersPage.routeName: (_) => FiltersPage(
              filterMap: _filteredMealsMap,
              filterFunction: _filtered,
            ),
      },
      // onGenerateRoute: , If some route not registered in route settings, it takes you to a certain setted route.
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (_) => const CategoriesPage(),
        ); // If no routes found in named routes or routes on the fly or on generated route, onUnknown routes takes you to a certain route instead of crashing the app.
      },
    );
  }
}
