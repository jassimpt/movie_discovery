import 'package:flutter/material.dart';
import 'package:movie_discovery/features/home/model/popular_model.dart';
import 'package:movie_discovery/features/home/model/trending_model.dart';
import 'package:movie_discovery/features/home/model/tv_show_model.dart';
import 'package:movie_discovery/features/home/service/home_service.dart';

class HomeController extends ChangeNotifier {
  final HomeService _service = HomeService();

  bool popularMoviesLoader = false;
  bool trendingNowLoader = false;
  bool top10Loader = false;
  bool africanMoviesLoader = false;
  bool newReleasesLoader = false;
  bool tvThrillersMysteryLoader = false;
  bool usTvShowsLoader = false;

  List<PopularMovie> popularMovies = [];
  List<TrendingResult> trendingNow = [];
  List<PopularMovie> top10Movies = [];
  List<PopularMovie> africanMovies = [];
  List<PopularMovie> newReleases = [];
  List<TvShow> tvThrillersMystery = [];
  List<TvShow> usTvShows = [];

  Future<void> getPopularMovies() async {
    try {
      popularMoviesLoader = true;
      notifyListeners();
      popularMovies = await _service.getPopularMovies();
    } catch (e) {
      popularMovies = [];
    } finally {
      popularMoviesLoader = false;
      notifyListeners();
    }
  }

  Future<void> getTrendingNow() async {
    try {
      trendingNowLoader = true;
      notifyListeners();
      trendingNow = await _service.getTrendingNow();
    } catch (e) {
      trendingNow = [];
    } finally {
      trendingNowLoader = false;
      notifyListeners();
    }
  }

  Future<void> getTop10Movies() async {
    try {
      top10Loader = true;
      notifyListeners();
      top10Movies = await _service.getTop10Movies();
    } catch (e) {
      top10Movies = [];
    } finally {
      top10Loader = false;
      notifyListeners();
    }
  }

  Future<void> getAfricanMovies() async {
    try {
      africanMoviesLoader = true;
      notifyListeners();
      africanMovies = await _service.getAfricanMovies();
    } catch (e) {
      africanMovies = [];
    } finally {
      africanMoviesLoader = false;
      notifyListeners();
    }
  }

  Future<void> getNewReleases() async {
    try {
      newReleasesLoader = true;
      notifyListeners();
      newReleases = await _service.getNewReleases();
    } catch (e) {
      newReleases = [];
    } finally {
      newReleasesLoader = false;
      notifyListeners();
    }
  }

  Future<void> getTvThrillersMystery() async {
    try {
      tvThrillersMysteryLoader = true;
      notifyListeners();
      tvThrillersMystery = await _service.getTvThrillersMystery();
    } catch (e) {
      tvThrillersMystery = [];
    } finally {
      tvThrillersMysteryLoader = false;
      notifyListeners();
    }
  }

  Future<void> getUsTvShows() async {
    try {
      usTvShowsLoader = true;
      notifyListeners();
      usTvShows = await _service.getUsTvShows();
    } catch (e) {
      usTvShows = [];
    } finally {
      usTvShowsLoader = false;
      notifyListeners();
    }
  }

  Future<void> fetchAllHomeData() async {
    await Future.wait([
      getPopularMovies(),
      getTrendingNow(),
      getTop10Movies(),
      getAfricanMovies(),
      getNewReleases(),
      getTvThrillersMystery(),
      getUsTvShows(),
    ]);
  }
}
