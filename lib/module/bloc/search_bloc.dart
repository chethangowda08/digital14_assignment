import 'package:digital_search_assignment/core/bloc/bloc.dart';
import 'package:digital_search_assignment/domain/repositories/digital_assignment_repository.dart';
import 'package:digital_search_assignment/module/view_model/search_view_model.dart';
import 'package:digital_search_assignment/domain/model/digital_assignment_model.dart';

class SearchBloc extends Bloc<SearchViewModel> {
  @override
  SearchViewModel initDefaultValue() {
    return SearchViewModel();
  }

  void getSearchResults(String searchText) async {
    state.searchViewModelState = SearchViewModelState.loading;
    emit(state);
    SearchRepository searchRepository = SearchRepositoryImpl();
    List<Event>? eventSearchResult =
        await searchRepository.searchEvents(searchText);

    if (eventSearchResult != null) {
      state.eventModel = _getSearchEvents(eventSearchResult);
      if (eventSearchResult.isNotEmpty) {
        state.searchViewModelState = SearchViewModelState.success;
        emit(state);
      } else {
        state.searchViewModelState = SearchViewModelState.emptyState;
        emit(state);
      }
    } else {
      state.searchViewModelState = SearchViewModelState.failure;
      emit(state);
    }
  }

  clearSuggestion() {
    state.eventModel = [];
    state.searchViewModelState = SearchViewModelState.clearState;
    emit(state);
  }

  List<EventModel> _getSearchEvents(List<Event>? events) {
    List<EventModel> eventModelList = [];
    if (events != null && events.isNotEmpty) {
      eventModelList = List.generate(
        events.length,
        (index) => EventModel.fromEvent(events[index]),
      );
    }
    return eventModelList;
  }
}
