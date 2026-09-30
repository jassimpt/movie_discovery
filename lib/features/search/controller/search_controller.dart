import 'dart:async';
import 'package:flutter/material.dart';
import 'package:movie_discovery/features/home/model/trending_model.dart';
import 'package:movie_discovery/features/search/service/search_service.dart';

class SearchController extends ChangeNotifier {
  final SearchService _service = SearchService.instance;

  bool isLoading = false;
  List<TrendingResult> searchResults = [];
  String currentQuery = '';
  Timer? _debounce;

  void search(String query) {
    currentQuery = query;
    if (_debounce?.isActive ?? false) _debounce?.cancel();

    if (query.trim().isEmpty) {
      searchResults = [];
      isLoading = false;
      notifyListeners();
      return;
    }

    _debounce = Timer(const Duration(milliseconds: 500), () async {
      try {
        isLoading = true;
        notifyListeners();
        final results = await _service.searchMulti(query);
        searchResults = results
            .where(
              (item) =>
                  item.mediaType != 'person' &&
                  (item.backdropPath != null || item.posterPath != null),
            )
            .toList();
      } catch (e) {
        searchResults = [];
      } finally {
        isLoading = false;
        notifyListeners();
      }
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }
}
