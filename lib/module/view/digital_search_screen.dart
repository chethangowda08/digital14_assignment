import 'package:digital_search_assignment/core/app_colors.dart';
import 'package:digital_search_assignment/core/app_routes.dart';
import 'package:digital_search_assignment/core/bloc/bloc_builder.dart';
import 'package:digital_search_assignment/core/consts.dart';
import 'package:digital_search_assignment/module/bloc/search_bloc.dart';
import 'package:digital_search_assignment/module/view/widgets/search_input_widget.dart';
import 'package:digital_search_assignment/module/view/widgets/suggestion_list_widget.dart';
import 'package:digital_search_assignment/module/view_model/search_view_model.dart';

import 'package:flutter/material.dart';

const String appBarTitle = "Digital Assignment";
const String hintText = "please search here";
const String errorText = "No items found";
const double thickness = 1;

class DigitalSearchScreen extends StatefulWidget {
  const DigitalSearchScreen({Key? key}) : super(key: key);

  @override
  State<DigitalSearchScreen> createState() => _DigitalSearchScreenState();
}

class _DigitalSearchScreenState extends State<DigitalSearchScreen> {
  final SearchBloc _searchBloc = SearchBloc();
  final TextEditingController _textFieldController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    super.dispose();
    _textFieldController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.kLight100,
        appBar: AppBar(
          title: const Text(
            appBarTitle,
            style: TextStyle(
              fontSize: kSize24,
              fontWeight: FontWeight.w400,
              color: AppColors.kLight100,
            ),
          ),
        ),
        body: SizedBox(
          height: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SearchInputWidget(
                searchHintText: hintText,
                searchTextController: _textFieldController,
                isLoading: _searchBloc.state.searchViewModelState ==
                    SearchViewModelState.loading,
                onSubmitted: onSubmitted,
                focusNode: _focusNode,
                onCrossButtonTap: () {
                  _searchBloc.clearSuggestion();
                  _textFieldController.text = "";
                },
              ),
              BlocBuilder(
                bloc: _searchBloc,
                builder: () {
                  switch (_searchBloc.state.searchViewModelState) {
                    case SearchViewModelState.loading:
                      return const Center(child: CircularProgressIndicator());
                    case SearchViewModelState.success:
                      return Expanded(
                          child: ListView.separated(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 15),
                        shrinkWrap: true,
                        itemCount: _searchBloc.state.eventModel.length,
                        itemBuilder: (context, index) {
                          return SuggestionListTile(
                            url: _searchBloc.state.eventModel[index]
                                    .performerList[0].image ??
                                '',
                            title: _searchBloc.state.eventModel[index].title,
                            subtitle: _searchBloc
                                .state.eventModel[index].displayLocation,
                            eventDate: _searchBloc
                                .state.eventModel[index].eventDate
                                .toIso8601String(),
                            onTap: () {
                              _navigateToNextScreen(
                                  _searchBloc.state.eventModel[index]);
                            },
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const Divider(
                            thickness: thickness,
                          );
                        },
                      ));
                    case SearchViewModelState.clearState:
                      return Container();
                    case SearchViewModelState.emptyState:
                      return const Center(
                        child: Text(errorText),
                      );
                    case SearchViewModelState.initial:
                      return defaultWidget();
                    case SearchViewModelState.failure:
                      return defaultWidget();
                  }
                },
              ),
            ],
          ),
        ));
  }

  Widget defaultWidget() {
    return const SizedBox();
  }

  onSubmitted(String searchText) async {
    if (searchText.isNotEmpty) {
      _searchBloc.getSearchResults(searchText);
    }
  }

  _navigateToNextScreen(EventModel eventModel) {
    Navigator.pushNamed(context, AppRoutes.digitalSearchResultScreen,
        arguments: eventModel);
  }
}
