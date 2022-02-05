import 'package:flutter/material.dart';

import '../screens/meals_page.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final String id;
  final Color color;
  const CategoryItem({
    required this.title,
    required this.color,
    Key? key,
    required this.id,
  }) : super(key: key);

  void _selectCategory(BuildContext ctx) {
    // Navigator.of(ctx).push(
    //   MaterialPageRoute(
    //     builder: (_) {
    //       return SelectCategoryPage(
    //         catId: id,
    //         catTitle: title,
    //         key: key,
    //       );
    //     },
    //   ),
    // ); for using routes not from named (main file 'routes');
    Navigator.of(ctx).pushNamed(
      MealsPage.routeName,
      arguments: {
        'id': id,
        'title': title,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).colorScheme.secondaryContainer,
      borderRadius: BorderRadius.circular(15),
      onTap: () {
        _selectCategory(context);
      },
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline2,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.65),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
