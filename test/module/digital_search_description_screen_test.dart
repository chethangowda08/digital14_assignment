import 'dart:io';

import 'package:digital_search_assignment/core/app_routes.dart';
import 'package:digital_search_assignment/module/view_model/search_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  setUpAll(() => HttpOverrides.global = null);
  group("Search suggestion screen", () {
    testWidgets('Search suggestion screen', (WidgetTester tester) async {
      await tester.runAsync(() async {
        await tester.pumpWidget(MaterialApp(
          routes: AppRoutes.getRoutes(),
          home: Scaffold(
            body: Builder(builder: (context) {
              return TextButton(
                child: const Text("press"),
                onPressed: () => Navigator.pushNamed(
                    context, AppRoutes.digitalSearchResultScreen,
                    arguments: EventModel(
                        title: "title",
                        url: "url",
                        eventDate: DateTime.now(),
                        displayLocation: "displayLocation",
                        performerList: [PerformerList(image: "")])),
              );
            }),
          ),
        ));
        await tester.pumpAndSettle();
        await tester.tap(find.text("press"));
        await tester.pumpAndSettle();
        await tester.pumpAndSettle();
      });
    });
  });
}
