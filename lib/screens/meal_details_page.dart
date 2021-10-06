import 'package:flutter/material.dart';

import '../dummy_data.dart';

class MealDetailsPage extends StatelessWidget {
  final Function favoriteMeals;
  final Function isMealFavorite;
  static const routeName = '/MealDetailsPage';

  const MealDetailsPage({
    Key? key,
    required this.favoriteMeals,
    required this.isMealFavorite,
  }) : super(key: key);

  Widget _buildTextHead(BuildContext context, String text) {
    return Container(
      height: 25,
      width: 150,
      margin: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headline2!.copyWith(
              fontSize: 22,
            ),
      ),
    );
  }

  Widget _buildWidgetContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        border: Border.all(
          color: Colors.blueGrey,
        ),
      ),
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(5),
      height: 175,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    final selectedMeals = dummyMeals.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          selectedMeals.title,
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                child: Image.network(
                  selectedMeals.imageUrl,
                  fit: BoxFit.cover,
                  height: 250,
                  width: double.infinity,
                ),
              ),
            ),
            _buildTextHead(context, 'Ingredients'),
            _buildWidgetContainer(
              ListView.builder(
                itemCount: selectedMeals.ingredients.length,
                itemBuilder: (ctx, index) {
                  return Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 1,
                    ),
                    margin: const EdgeInsets.symmetric(
                      vertical: 6,
                      horizontal: 20,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Theme.of(context).colorScheme.primaryVariant,
                    ),
                    child: Text(
                      selectedMeals.ingredients[index],
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  );
                },
              ),
            ),
            _buildTextHead(context, "Steps"),
            _buildWidgetContainer(
              ListView.builder(
                itemCount: selectedMeals.steps.length,
                itemBuilder: (ctx, index) {
                  return Column(
                    children: [
                      ListTile(
                        title: Text(
                          selectedMeals.steps[index],
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                          ),
                        ),
                        leading: CircleAvatar(
                          backgroundColor:
                              Theme.of(context).colorScheme.secondaryVariant,
                          child: Text(
                            '${index + 1}',
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const Divider(
                        color: Colors.blueGrey,
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          favoriteMeals(mealId) as void Function()?;
        },
        child: Icon(
          isMealFavorite(mealId) ? Icons.star : Icons.star_outline,
        ),
      ),
    );
  }
}
