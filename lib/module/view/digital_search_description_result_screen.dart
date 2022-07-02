import 'package:digital_search_assignment/core/app_colors.dart';
import 'package:digital_search_assignment/core/consts.dart';
import 'package:digital_search_assignment/module/helper/search_helper.dart';
import 'package:digital_search_assignment/module/view_model/search_view_model.dart';
import 'package:flutter/material.dart';

const int kMaxLines = 2;

class DigitalSearchResultScreen extends StatefulWidget {
  const DigitalSearchResultScreen({Key? key}) : super(key: key);

  @override
  State<DigitalSearchResultScreen> createState() =>
      _DigitalSearchResultScreenState();
}

class _DigitalSearchResultScreenState extends State<DigitalSearchResultScreen> {
  EventModel? events;
  @override
  Widget build(BuildContext context) {
    events = ModalRoute.of(context)?.settings.arguments as EventModel;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          events?.title ?? "",
          style: const TextStyle(
            fontSize: kSize24,
            fontWeight: FontWeight.w700,
            color: AppColors.kLight100,
          ),
          maxLines: kMaxLines,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.kLight100),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 250,
              width: MediaQuery.of(context).size.width * 0.9,
              margin: const EdgeInsets.symmetric(
                  vertical: kSize20, horizontal: kSize5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(kSize16),
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image:
                          NetworkImage(events?.performerList[0].image ?? ""))),
            ),
            Padding(
              padding: const EdgeInsets.only(top: kSize7),
              child: Text(
                SearchHelper.getddMMMMyyyykkmm(
                    events?.eventDate ?? DateTime.now()),
                style: const TextStyle(
                  fontSize: kSize20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: kSize7),
              child: Text(
                events?.displayLocation ?? "",
                style: const TextStyle(
                  fontSize: kSize20,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
