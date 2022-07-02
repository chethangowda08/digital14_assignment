import 'dart:io';

import 'package:digital_search_assignment/module/view/widgets/suggestion_list_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  setUpAll(() => HttpOverrides.global = null);
  group("Description Empty State Widget", () {
    testWidgets("Description Empty State Widget", (tester) async {
      Widget widget = getMaterialWrapper(
        const SuggestionListTile(
            title: "title",
            subtitle: "subtitle",
            url:
                "https://www.learningcontainer.com/wp-content/uploads/2020/07/Large-Sample-Image-download-for-Testing.jpg",
            eventDate: "eventDate"),
      );
      await tester.pumpWidget(widget);
      await tester.pumpAndSettle();
    });
  });
}

Widget getMaterialWrapper(Widget child) {
  return SizedBox(
    height: 400,
    child: MaterialApp(home: Material(child: child)),
  );
}
