import 'package:flutter/foundation.dart';
import 'package:patrol/patrol.dart';
import 'utils/test_extension.dart';

class MainScreen {
  final PatrolIntegrationTester tester;

  MainScreen(this.tester);

  Future<SocialScreen> openSocialScreen() async {
    await tester.tapByKey(Key('go_to_social_screen_button'));

    return SocialScreen(tester);
  }

  Future<void> loginWith({required credentials}) async {
    await tester.tapByKey(Key('loginButton'));
    // login logic here
  }
}

class SocialScreen {
  final PatrolIntegrationTester tester;

  SocialScreen(this.tester);

  bool isNotificationDotVisible() {
    return tester(Key('notificationCounter')).visible;
  }

  int getNotificationsCount() {
    if (isNotificationDotVisible()) {
      return int.parse(tester(Key('notificationCounter')).text ?? '');
    } else {
      return 0;
    }
  }

  Future<NotificationScreen> openNotificationScreen() async {
    await tester.tapByKey(Key('notificationButton'));

    return NotificationScreen(tester);
  }
}

class NotificationScreen {
  final PatrolIntegrationTester tester;

  NotificationScreen(this.tester);
}
