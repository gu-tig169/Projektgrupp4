import 'package:flutter/material.dart';

import '../main_screen.dart';

class HomeScreen extends StatelessWidget {
  final Widget _favorites = Icon(Icons.star, color: Colors.white, size: 40);
  final Widget _search = Icon(Icons.search, color: Colors.white, size: 40);
  final Widget _notifications = Icon(Icons.notifications, color: Colors.white, size: 40);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Crypto 296',
        ),
      ),
      body: Center(
        child: ListView(
          children: [
            _customButton(context, 'Favorites', _favorites, 2),
            _customButton(context, 'Search', _search, 1),
            _customButton(context, 'Notifications', _notifications, 0),
          ],
        ),
      ),
    );
  }

// Revision 1
//   Widget _customButton(context, String title, Widget icon, int tabIndex) {
//     return Expanded(
//       child: Padding(
//         padding: const EdgeInsets.only(top: 40, bottom: 40),
//         child: InkWell(
//           onTap: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => MainScreen(tabIndex),
//               ),
//             );
//           },
//           child: Container(
//             padding: EdgeInsets.only(top: 30, bottom: 30),
//             alignment: FractionalOffset.center,
//             color: Theme.of(context).primaryColor,
//             child: Row(
//               children: <Widget>[
//                 Padding(
//                   padding: const EdgeInsets.only(left: 30, right: 30.0),
//                   child: icon,
//                 ),
//                 Container(
//                   padding: const EdgeInsets.all(8),
//                   child: Text(title, style: TextStyle(fontSize: 25, color: Colors.white)),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// Revision 2
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
          padding: EdgeInsets.only(top: 40),
          child: Container(
            margin: EdgeInsets.only(left: 24.0, right: 24.0),
            width: 340,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                boxShadow: [BoxShadow(blurRadius: 5.0, offset: Offset.fromDirection(3.0))],
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context).primaryColor,
                    Colors.purple[300],
                  ],
                )),
            padding: EdgeInsets.only(top: 30, bottom: 30),
            alignment: FractionalOffset.center,
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30.0),
                  child: icon,
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: Text(title, style: TextStyle(fontSize: 25, color: Colors.white)),
                ),
              ],
            ),
          )),
    );
  }
}
