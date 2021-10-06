import 'package:flutter/material.dart';

import '../items/my_drawer.dart';
import '../screens/categories_page.dart';
import '../screens/favorites_page.dart';
import '../models/meal.dart';

class TabsPage extends StatefulWidget {
  final List<Meal> favoriteMeals;
  const TabsPage({
    Key? key,
    required this.favoriteMeals,
  }) : super(key: key);

  @override
  _TabsPageState createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  late List<Map<String, Object>> _pages;

  int _selectedIndex = 0;
  @override
  void initState() {
    _pages = [
      {
        'page': const CategoriesPage(),
        'title': 'Categories',
      },
      {
        'page': FavoritesPage(
          favoriteMeals: widget.favoriteMeals,
        ),
        'title': 'Favorites',
      }
    ];
    super.initState();
  }

  void _selectedTab(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      appBar: AppBar(
        title: Text(
          _pages[_selectedIndex]['title'] as String,
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      body: _pages[_selectedIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w800,
        ),
        type: BottomNavigationBarType.shifting,
        currentIndex: _selectedIndex,
        onTap: _selectedTab,
        backgroundColor: Theme.of(context).colorScheme.primary,
        selectedItemColor: const Color(0xff0C0908),
        unselectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).colorScheme.primary,
            icon: const Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).colorScheme.primary,
            icon: const Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
