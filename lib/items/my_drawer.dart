import 'package:flutter/material.dart';

import '../screens/filters_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _buildListTile(
      IconData icon,
      String title,
      Function tapHandler,
    ) {
      return ListTile(
        leading: Icon(
          icon,
          size: 26,
          color: const Color(0xff312521),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 24,
            fontFamily: 'Robotocondensed',
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.secondaryVariant,
          ),
        ),
        onTap: () {
          tapHandler();
        },
      );
    }

    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).colorScheme.secondary,
            child: Text(
              'Bone Apetite!',
              style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 26,
                  color: Theme.of(context).colorScheme.primary),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          _buildListTile(
            Icons.restaurant,
            'Meals',
            () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          _buildListTile(
            Icons.filter,
            'Filters',
            () {
              Navigator.of(context).pushReplacementNamed(FiltersPage.routeName);
            },
          ),
        ],
      ),
    );
  }
}
