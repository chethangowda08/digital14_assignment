// To parse this JSON data, do
//
//     final DigitalAssignmentSearchModel = DigitalAssignmentSearchModelFromMap(jsonString);

import 'dart:convert';

class DigitalAssignmentSearchModel {
  DigitalAssignmentSearchModel({
    this.events,
  });

  final List<Event>? events;

  factory DigitalAssignmentSearchModel.fromJson(String str) =>
      DigitalAssignmentSearchModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DigitalAssignmentSearchModel.fromMap(Map<String, dynamic> json) =>
      DigitalAssignmentSearchModel(
        events: json["events"] == null
            ? null
            : List<Event>.from(json["events"].map((x) => Event.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "events": events == null
            ? null
            : List<dynamic>.from(events!.map((x) => x.toMap())),
      };
}

class Event {
  Event({
    this.venue,
    this.datetimeLocal,
    this.url,
    this.title,
    this.performers,
  });

  final Venue? venue;
  final DateTime? datetimeLocal;
  final String? url;
  final String? title;
  List<Performer>? performers;
  factory Event.fromJson(String str) => Event.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Event.fromMap(Map<String, dynamic> json) => Event(
        venue: json["venue"] == null ? null : Venue.fromMap(json["venue"]),
        datetimeLocal: json["datetime_utc"] == null
            ? null
            : DateTime.parse(json["datetime_utc"]),
        url: json["url"],
        title: json["title"],
        performers: json["performers"] == null
            ? null
            : List<Performer>.from(
                json["performers"].map((x) => Performer.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "venue": venue == null ? null : venue!.toMap(),
        "datetime_utc": datetimeLocal,
        "url": url,
        "title": title,
        "performers": performers == null
            ? null
            : List<dynamic>.from(performers!.map((x) => x.toMap())),
      };
}

class Venue {
  Venue({
    this.displayLocation,
  });

  final String? displayLocation;

  factory Venue.fromJson(String str) => Venue.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Venue.fromMap(Map<String, dynamic> json) => Venue(
        displayLocation: json["display_location"],
      );

  Map<String, dynamic> toMap() => {
        "display_location": displayLocation,
      };
}

class Performer {
  Performer({
    this.image,
  });

  final String? image;

  factory Performer.fromJson(String str) => Performer.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Performer.fromMap(Map<String, dynamic> json) => Performer(
        image: json["image"],
      );

  Map<String, dynamic> toMap() => {
        "image": image,
      };
}
