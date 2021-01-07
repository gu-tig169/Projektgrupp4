import 'package:Projektgrupp4/ui/screens/notification_screen/notification_list_view.dart';

import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  final String title = 'Notifications';
  @override
  Widget build(BuildContext context) {
    return Container(
      child: NotificationListView(),
    );
  }
}
