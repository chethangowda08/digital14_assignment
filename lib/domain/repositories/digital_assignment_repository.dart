import 'dart:convert';

import 'package:digital_search_assignment/domain/model/digital_assignment_model.dart';
import 'package:http/http.dart' as http;

const String clientId = "Mjc2NjI2Mjd8MTY1NjU5MjQ2Ni44MDM3MjQ4";

abstract class SearchRepository {
  Future<List<Event>?> searchEvents(String query);
}

class SearchRepositoryImpl extends SearchRepository {
  @override
  Future<List<Event>?> searchEvents(String query) async {
    final url = Uri.parse(
        'https://api.seatgeek.com/2/events?client_id=$clientId&q=$query');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);

      List<Event>? events = DigitalAssignmentSearchModel.fromMap(data).events;

      return events;
    } else {
      throw Exception('Failed');
    }
  }
}
