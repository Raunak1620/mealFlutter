import 'package:flutter/material.dart';
import '../screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  // Updated the tapHandler parameter type to match the expected void Function() type
  Widget buildListTile(
      String title, IconData icon, void Function()? tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 24,
            fontWeight: FontWeight.bold),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            // Replaced accentColor with colorScheme.secondary
            color: Theme.of(context).colorScheme.secondary,
            child: Text(
              'Cooking Up!!',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                // Using primaryColor for text color
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile('Meals', Icons.restaurant, () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          buildListTile('Filters', Icons.settings, () {
            Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
          }),
        ],
      ),
    );
  }
}
