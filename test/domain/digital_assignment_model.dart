import 'package:digital_search_assignment/domain/model/digital_assignment_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mock/fixture_reader.dart';

void main() {
  final String json = fixture("search/mock_data.json");
  DigitalAssignmentSearchModel digitalAssignmentSearchModel =
      DigitalAssignmentSearchModel.fromJson(json);
  Event event = Event.fromJson(json);
  Venue venue = Venue.fromJson(json);
  Performer performer = Performer.fromJson(json);

  test("Search Model", () {
    ///Convert into Model
    DigitalAssignmentSearchModel model = digitalAssignmentSearchModel;
    expect(model.events != null, true);

    ///convert into map
    Map<String, dynamic> map = model.toMap();

    ///Convert to String
    String stringData = model.toString();
    expect(stringData.isNotEmpty, true);
  });
  test("Search Model", () {
    ///Convert into Model
    Event model = event;
    expect(model.venue != null, false);

    ///convert into map
    Map<String, dynamic> map = model.toMap();

    ///Convert to String
    String stringData = model.toString();
    expect(stringData.isNotEmpty, true);
  });
  test("Search Model", () {
    ///Convert into Model
    Venue model = venue;
    expect(model.displayLocation != null, false);

    ///Convert to String
    String stringData = model.toString();
    expect(stringData.isNotEmpty, true);
  });
  test("Search Model", () {
    ///Convert into Model
    Performer model = performer;
    expect(model.image != null, false);

    ///Convert to String
    String stringData = model.toString();
    expect(stringData.isNotEmpty, true);
  });
}
