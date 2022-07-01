import 'package:digital_search_assignment/domain/model/digital_assignment_model.dart';
import 'package:digital_search_assignment/module/helper/search_helper.dart';

class SearchViewModel {
  List<EventModel> eventModel;
  SearchViewModelState searchViewModelState;

  SearchViewModel(
      {this.eventModel = const [],
      this.searchViewModelState = SearchViewModelState.initial});
}

class EventModel {
  final String title;
  final DateTime eventDate;

  final String url;
  final String displayLocation;
  final List<PerformerList> performerList;
  EventModel(
      {required this.title,
      required this.url,
      required this.eventDate,
      required this.displayLocation,
      required this.performerList});

  factory EventModel.fromEvent(Event event) {
    return EventModel(
      title: event.title ?? '',
      eventDate: event.datetimeLocal ?? DateTime.now(),
      url: event.url ?? '',
      displayLocation: event.venue?.displayLocation ?? '',
      performerList: SearchHelper.getImage(event.performers),
    );
  }
}

enum SearchViewModelState {
  initial,
  loading,
  success,
  failure,
  clearState,
  emptyState
}

class PerformerList {
  final String? image;
  PerformerList({this.image});
}
