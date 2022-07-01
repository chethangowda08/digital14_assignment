import 'package:digital_search_assignment/core/app_colors.dart';
import 'package:digital_search_assignment/core/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const double _kTextBoxHeight = 40.0;

const int _kMaxLine = 1;
const String _searchFormatter = r"[A-Za-z\u0E00-\u0E7F0-9-'’#&()@ *:,./ ]";

class SearchInputWidget extends StatefulWidget {
  final String searchHintText;
  final TextEditingController searchTextController;
  final FocusNode focusNode;
  final Function(String)? onSubmitted;
  final Function()? onCrossButtonTap;
  final Function()? onTextFieldTap;
  final bool isLoading;

  const SearchInputWidget({
    Key? key,
    required this.searchHintText,
    required this.searchTextController,
    required this.focusNode,
    this.onCrossButtonTap,
    this.onTextFieldTap,
    this.isLoading = false,
    this.onSubmitted,
  }) : super(key: key);

  @override
  State<SearchInputWidget> createState() => _SearchInputWidgetState();
}

class _SearchInputWidgetState extends State<SearchInputWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: _kTextBoxHeight,
      padding: const EdgeInsets.only(left: kSize12),
      margin: const EdgeInsets.symmetric(horizontal: kSize24, vertical: kSize8),
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(kSize8)),
        color: AppColors.kPrimary24,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [_buildSearchIcon(), _buildTextField(), _buildCrossIcon()],
      ),
    );
  }

  Widget _buildSearchIcon() {
    return const Icon(
      Icons.search,
      color: AppColors.kGrey20,
    );
  }

  Widget _buildCrossIcon() {
    return Padding(
      padding: const EdgeInsets.only(right: kSize8),
      child: GestureDetector(
        onTap: widget.onCrossButtonTap,
        child: const Icon(
          Icons.close,
          color: AppColors.kGrey20,
        ),
      ),
    );
  }

  Widget _buildTextField() {
    return Expanded(
      child: TextField(
        focusNode: widget.focusNode,
        controller: widget.searchTextController,
        onSubmitted: widget.onSubmitted,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintStyle: const TextStyle(color: AppColors.kGrey20),
          fillColor: AppColors.kSecondarySplash,
          hintText: widget.searchHintText,
          isCollapsed: true,
        ),
        maxLines: _kMaxLine,
        inputFormatters: [
          FilteringTextInputFormatter.allow(
            RegExp(_searchFormatter),
          ),
        ],
        onTap: widget.onTextFieldTap,
        textAlignVertical: TextAlignVertical.center,
      ),
    );
  }
}
