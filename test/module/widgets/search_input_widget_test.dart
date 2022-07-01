import 'package:digital_search_assignment/module/view/widgets/search_input_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TextEditingController _searchTextController = TextEditingController();
  FocusNode _focusNode = FocusNode();

  testWidgets('Car Search Input Widget Test...', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: SearchInputWidget(
          searchTextController: _searchTextController,
          searchHintText: 'test',
          focusNode: _focusNode,
        ),
      ),
    ));
  });
}
