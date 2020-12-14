import 'package:Projektgrupp4/screens/favorites_screen/favorites_screen.dart';
import 'package:Projektgrupp4/screens/notification_screen/notification_screen.dart';
import 'package:Projektgrupp4/screens/search_screen/search_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  final NotificationScreen notificationScreen = NotificationScreen();
  final SearchScreen searchScreen = SearchScreen();
  final FavoritesScreen favoritesScreen = FavoritesScreen();

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with SingleTickerProviderStateMixin {
  TabController _tabController;
  String _title;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _changeTitle(_tabController.index);
  }

  void _changeTitle(int value) {
    switch (value) {
      case 0:
        _title = widget.notificationScreen.title;
        break;
      case 1:
        _title = widget.searchScreen.title;
        break;
      case 2:
        _title = widget.favoritesScreen.title;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_title)),
      bottomNavigationBar: Material(
        color: Theme.of(context).primaryColor,
        child: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          unselectedLabelColor: Theme.of(context).primaryColorLight,
          onTap: (value) {
            setState(() {
              _changeTitle(value);
            });
          },
          tabs: [
            Tab(icon: Icon(Icons.notifications)),
            Tab(icon: Icon(Icons.search)),
            Tab(icon: Icon(Icons.star)),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          widget.notificationScreen,
          widget.searchScreen,
          widget.favoritesScreen,
        ],
      ),
    );
  }
}
