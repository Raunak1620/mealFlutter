import 'package:flutter/material.dart';
import './categories_screen.dart';
import './favorites_screen.dart';
import '../widgets/main_drawer.dart';
import '../models/meal.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;
  TabsScreen(this.favoriteMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  // Initialize _pages as an empty list initially to avoid nullability issues
  List<Map<String, Object>> _pages = [];

  int _selectedPageIndex = 0;

  @override
  void initState() {
    super.initState();
    // Initialize _pages inside initState to avoid null value errors
    _pages = [
      {
        'page': CategoriesScreen(),
        'title': 'Categories',
      },
      {
        'page': FavoritesScreen(widget.favoriteMeals),
        'title': 'Your Favourite',
      },
    ];
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            _pages[_selectedPageIndex]['title'] as String), // Cast to String
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['page'] as Widget, // Cast to Widget
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context)
            .colorScheme
            .secondary, // Replace 'accentColor' with 'colorScheme.secondary'
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            label: 'Categories', // Use 'label' instead of 'title'
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.star),
            label: 'Favorites', // Use 'label' instead of 'title'
          ),
        ],
      ),
    );
  }
}
