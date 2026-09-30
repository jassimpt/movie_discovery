import 'package:flutter/material.dart';
import 'package:movie_discovery/features/coming_soon/service/coming_soon_service.dart';
import 'package:movie_discovery/features/home/model/popular_model.dart';

class ComingSoonController extends ChangeNotifier {
  final ComingSoonService _service = ComingSoonService.instance;

  bool isLoading = false;
  List<PopularMovie> upcomingMovies = [];

  Future<void> getUpcomingMovies() async {
    try {
      isLoading = true;
      notifyListeners();
      upcomingMovies = await _service.getUpcomingMovies();
    } catch (e) {
      upcomingMovies = [];
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}