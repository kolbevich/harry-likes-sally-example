import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

import '../test_users_data.dart';
import '../utils/graphQL_rest_client.dart';
import '../utils/test_extension.dart';

void main() {
  patrolSetUp() async {
    // API calls before test
    final sally = await GraphQLRestClient(sallyCredentials).initialize();
    await sally.readAllNotifications();

    final postId = await sally.getLastPostId();

    final harry = await GraphQLRestClient(harryCredentials).initialize();
    await harry.likePost(postId);
  }

  patrolTest(
    "When Sally, as a user of the MeetCute app, receives a like from another user (Harry), she sees a dot with a counter appear on the notification button.",
    ($) async {
      // UI level interactions
      final mainScreen = await $.openMeetCuteApp();
      await mainScreen.loginWith(credentials: sallyCredentials);

      final socialScreen = await mainScreen.openSocialScreen();
      final notificationsCount = await socialScreen.getNotificationsCount();

      expect(
        notificationsCount == 1,
        isTrue,
        reason: 'Expected to have 1 new notifications, but found  $notificationsCount',
      );
    },
  );
}
