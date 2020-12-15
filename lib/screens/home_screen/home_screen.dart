import 'package:flutter/material.dart';

import '../main_screen.dart';

class HomeScreen extends StatelessWidget {
  final Widget _favorites = Icon(Icons.star, color: Colors.white, size: 70);
  final Widget _search = Icon(Icons.search, color: Colors.white, size: 70);
  final Widget _notifications =
      Icon(Icons.notifications, color: Colors.white, size: 70);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Welcome to Crypto 296',
            style: TextStyle(fontSize: 30),
          ),
        ),
        body: Center(
          child: Column(
            children: [
              _customButton(context, 'Favorites', _favorites, 2),
              _customButton(context, 'Search', _search, 1),
              _customButton(context, 'Notifications', _notifications, 0),
            ],
          ),
        ));
  }

  Widget _customButton(context, String title, Widget icon, int tabIndex) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MainScreen(tabIndex),
          ),
        );
      },
      child: Padding(
          padding: EdgeInsets.only(top: 60),
          child: Container(
            padding: EdgeInsets.only(top: 30, bottom: 30),
            alignment: FractionalOffset.center,
            color: Theme.of(context).primaryColor,
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30.0),
                  child: icon,
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: Text(title,
                      style: TextStyle(fontSize: 40, color: Colors.white)),
                ),
              ],
            ),
          )),
    );
  }
}
