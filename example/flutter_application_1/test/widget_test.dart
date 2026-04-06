// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_application_1/main.dart';

void main() {
  testWidgets('home shows API list', (WidgetTester tester) async {
    await tester.pumpWidget(const ApiTesterApp());

    expect(find.text('innertube_dart API tester'), findsOneWidget);
    expect(find.text('getVideo'), findsOneWidget);
    expect(find.text('search'), findsOneWidget);
    expect(find.text('getTrending'), findsOneWidget);
    expect(find.text('getPlaylist'), findsOneWidget);
    expect(find.text('getChannel'), findsOneWidget);

    await tester.scrollUntilVisible(
      find.text('getMusicHome'),
      250,
      scrollable: find.byType(Scrollable).first,
    );
    await tester.pumpAndSettle();

    expect(find.text('getMusicHome'), findsOneWidget);
    expect(find.text('suggestQueries'), findsOneWidget);
  });
}
