import 'package:digital_search_assignment/domain/model/digital_assignment_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mock/fixture_reader.dart';

void main() {
  final String json = fixture("search/mock_data.json");
  DigitalAssignmentSearchModel digitalAssignmentSearchModel =
      DigitalAssignmentSearchModel.fromJson(json);

  test("OtaSearch Model", () {
    ///Convert into Model
    DigitalAssignmentSearchModel model = digitalAssignmentSearchModel;
    expect(model.events != null, true);

    ///convert into map
    Map<String, dynamic> map = model.toMap();

    ///Check map conversion
    DigitalAssignmentSearchModel mapFromModel =
        DigitalAssignmentSearchModel.fromMap(map);
    expect(mapFromModel.events != null, true);

    ///Convert to String
    String stringData = model.toString();
    expect(stringData.isNotEmpty, true);

    ///Convert to json
    String jsondata = model.toJson();
    expect(jsondata.isNotEmpty, true);
  });
}
