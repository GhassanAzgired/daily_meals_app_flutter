import 'package:flutter/material.dart';

import '../items/my_drawer.dart';

class FiltersPage extends StatefulWidget {
  final Function filterFunction;
  final Map<String, bool> filterMap;
  const FiltersPage({
    Key? key,
    required this.filterFunction,
    required this.filterMap,
  }) : super(key: key);

  static const routeName = '/filters';

  @override
  State<FiltersPage> createState() => _FiltersPageState();
}

class _FiltersPageState extends State<FiltersPage> {
  var _lactoseFree = false;
  var _glutenFree = false;
  var _vegan = false;
  var _vegetarian = false;

  @override
  void initState() {
    _lactoseFree = widget.filterMap['lactose'] as bool;
    _glutenFree = widget.filterMap['gluten'] as bool;
    _vegan = widget.filterMap['vegan'] as bool;
    _vegetarian = widget.filterMap['vegetarian'] as bool;

    super.initState();
  }

  Widget _buildSwitchListTile(
    String title,
    String subtitle,
    bool value,
    Function changeValueFunction,
  ) {
    return ListTile(
      title: SwitchListTile(
        activeColor: Theme.of(context).colorScheme.secondaryVariant,
        title: Text(title),
        subtitle: Text(subtitle),
        onChanged: changeValueFunction as void Function(bool)?,
        value: value,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              final Map<String, bool> _filter = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
              };
              widget.filterFunction(_filter);
            },
          )
        ],
        title: Text(
          'Filters',
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: Text(
              'Adjust your displayed meals.',
              style: Theme.of(context).textTheme.headline2,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildSwitchListTile(
                  'Lactose-Free.',
                  'Include only lactose-free meals',
                  _lactoseFree,
                  (value) {
                    setState(
                      () {
                        _lactoseFree = value;
                      },
                    );
                  },
                ),
                _buildSwitchListTile(
                  'Gluten-Free.',
                  'Include only Gluten-free meals',
                  _glutenFree,
                  (value) {
                    setState(
                      () {
                        _glutenFree = value;
                      },
                    );
                  },
                ),
                _buildSwitchListTile(
                  'Vegan.',
                  'Include only vegan meals',
                  _vegan,
                  (value) {
                    setState(
                      () {
                        _vegan = value;
                      },
                    );
                  },
                ),
                _buildSwitchListTile(
                  'Vegetarian.',
                  'Include only vegetarian meals',
                  _vegetarian,
                  (value) {
                    setState(
                      () {
                        _vegetarian = value;
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
