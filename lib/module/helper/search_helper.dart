import 'package:digital_search_assignment/domain/model/digital_assignment_model.dart';
import 'package:digital_search_assignment/module/view_model/search_view_model.dart';

class SearchHelper {
  static List<PerformerList> getImage(List<Performer>? perfomer) {
    List<PerformerList> imageUrl = [];
    if (perfomer == null || perfomer.isEmpty) {
      return imageUrl;
    }
    for (int i = 0; i < perfomer.length; i++) {
      imageUrl.add(PerformerList(
        image: perfomer[i].image ?? "",
      ));
    }
    return imageUrl;
  }
}
