import 'package:flutter/material.dart';
import 'package:harry_likes_sally_example/services/graphql_helper.dart';
import 'notifications_screen.dart';
import 'keys.dart';

class SocialScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Stack(
            children: [
              IconButton(
                key: AppKeys.notificationsButton,
                icon: Icon(
                  Icons.favorite,
                  size: 30,
                ),
                onPressed: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NotificationsScreen()),
                  );
                },
              ),
              Positioned(
                right: 8,
                top: 8,
                child: FutureBuilder<int>(
                  future: GraphQLHelper().getUnreadNotificationsCount(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return SizedBox.shrink();
                    }
                    return CircleAvatar(
                      radius: 8,
                      backgroundColor: Colors.pinkAccent,
                      child: Text(
                        '${snapshot.data}',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 100,
              height: 100,
              color: Colors.grey,
              child: Icon(Icons.image),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              key: AppKeys.likeButton,
              onPressed: () async {
                // mock data: mock postId 000-000
                await GraphQLHelper().likePost('000-000');
              },
              child: Text('Like'),
            ),
          ],
        ),
      ),
    );
  }
}
