import 'package:digital_search_assignment/core/consts.dart';
import 'package:flutter/material.dart';

const int _kMaxLines1 = 1;
const String networkImageKey = "networkImageKey";

class SuggestionListTile extends StatelessWidget {
  final String url;
  final String title;
  final String subtitle;
  final String eventDate;
  final Function()? onTap;
  const SuggestionListTile({
    Key? key,
    required this.title,
    required this.subtitle,
    this.onTap,
    required this.url,
    required this.eventDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              key: const Key(networkImageKey),
              height: kSize70,
              width: kSize70,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(kSize7),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                      url,
                    ),
                  )),
            ),
          ),
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.only(left: kSize24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: _kMaxLines1,
                    style: const TextStyle(
                      fontSize: kSize16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: kSize8),
                    child: Text(
                      subtitle,
                      overflow: TextOverflow.ellipsis,
                      maxLines: _kMaxLines1,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: kSize8),
                    child: Text(
                      eventDate,
                      overflow: TextOverflow.ellipsis,
                      maxLines: _kMaxLines1,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
