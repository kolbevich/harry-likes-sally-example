import 'package:flutter/material.dart';
import 'package:harry_likes_sally_example/services/graphql_helper.dart';
import 'keys.dart';

class NotificationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Mark all notifications as read when the screen opens
    GraphQLHelper().markAllNotificationsAsRead();

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(key: AppKeys.backButton),
        title: Text('Notifications'),
      ),
      body: Center(
        child: Text('Screen is not yet implemented'),
      ),
    );
  }
}
