import 'package:flutter/foundation.dart';
import 'package:harry_likes_sally_example/main.dart';
import 'package:patrol/patrol.dart';
import 'package:flutter_test/flutter_test.dart';

import '../screens.dart';

extension TestExtension on PatrolIntegrationTester {
  Future<MainScreen> openMeetCuteApp() async {
    await pumpWidget(MeetCuteApp());
    for (var i = 0; i < (10); i++) {
      await pump(const Duration(seconds: 1));
    }
    return MainScreen(this);
  }

  Future<void> tapByKey(Key key, {int pumpFrames = 1}) async {
    await tap(find.byKey(key));
    for (var i = 0; i < pumpFrames; i++) {
      await pump(const Duration(seconds: 1));
    }
  }
}
