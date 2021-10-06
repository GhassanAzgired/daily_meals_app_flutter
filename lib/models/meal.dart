enum Complexity {
  simple,
  hard,
  challenging,
}
enum Affordability {
  affordable,
  pricy,
  luxurious,
}

class Meal {
  final String imageUrl;
  final String title;
  final List<String> steps;
  final String id;
  final List<String> categories;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;
  final bool isGlutenFree;
  final List<String> ingredients;
  final int duration;
  final Affordability affordability;
  final Complexity complexity;
  const Meal({
    required this.affordability,
    required this.categories,
    required this.complexity,
    required this.duration,
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.ingredients,
    required this.isGlutenFree,
    required this.isLactoseFree,
    required this.isVegan,
    required this.isVegetarian,
    required this.steps,
  });
}
