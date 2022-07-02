import 'package:digital_search_assignment/module/view/widgets/suggestion_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

const String networkImageKey = "networkImageKey";
void main() {
  testWidgets('Search Input Widget Test...', (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: SuggestionListTile(
          title: "",
          eventDate: "",
          subtitle: "",
          url: "",
        ),
      ),
    ));
    await tester.tap(find.byKey(Key("networkImageKey")));
    await tester.pumpAndSettle();
  });
}
