import 'dart:convert';

import 'package:medusa_admin/core/utils/enums.dart';

class SearchHistory {
  final String text;
  final SearchCategory searchableFields;

  SearchHistory({required this.text, required this.searchableFields});

  factory SearchHistory.fromJson(Map<String, dynamic> json) {
    return SearchHistory(
        text: json['text'],
        searchableFields: SearchCategory.fromJson(json['searchableField']));
  }

  static Map<String, dynamic> toJson(SearchHistory searchHistory) {
    return {
      'text': searchHistory.text,
      'searchableField': searchHistory.searchableFields.index,
    };
  }

  static String encode(List<SearchHistory> searchHistoryList) => json.encode(
    searchHistoryList
        .map<Map<String, dynamic>>(
            (searchHistory) => SearchHistory.toJson(searchHistory))
        .toList(),
  );
  static List<SearchHistory> decode(String searchHistoryList) =>
      (json.decode(searchHistoryList) as List<dynamic>)
          .map<SearchHistory>(
              (searchHistory) => SearchHistory.fromJson(searchHistory))
          .toList();
}
