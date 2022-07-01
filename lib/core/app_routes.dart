import 'package:digital_search_assignment/module/view/digital_search_screen.dart';
import 'package:digital_search_assignment/module/view/digital_search_description_result_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  // Route name constants
  static const String digitalSearchScreen = '/digitalSearchScreen';
  static const String digitalSearchResultScreen = '/digitalSearchResultScreen';

  /// The map used to define our routes, needs to be supplied to [MaterialApp]
  static Map<String, WidgetBuilder> getRoutes() {
    return {
      digitalSearchScreen: (context) => const DigitalSearchScreen(),
      digitalSearchResultScreen: (context) => const DigitalSearchResultScreen(),
    };
  }
}
