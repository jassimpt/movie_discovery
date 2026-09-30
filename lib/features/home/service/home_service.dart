import 'package:dio/dio.dart';
import 'package:movie_discovery/core/constants/url_constants.dart';
import 'package:movie_discovery/core/network/dio_interceptor.dart';
import 'package:movie_discovery/features/home/model/popular_model.dart';
import 'package:movie_discovery/features/home/model/trending_model.dart';
import 'package:movie_discovery/features/home/model/tv_show_model.dart';

class HomeService {
  final Dio _dio = DioClient.instance.dio;

  Future<List<PopularMovie>> getPopularMovies({int page = 1}) async {
    try {
      final Response response = await _dio.get(
        UrlConstants.popularMovies,
        queryParameters: {'language': 'en-US', 'page': page},
      );
      if (response.statusCode == 200) {
        final List<dynamic> movies = response.data['results'];
        return movies.map((e) => PopularMovie.fromJson(e)).toList();
      } else {
        throw Exception('Failed to fetch popular movies');
      }
    } catch (e) {
      throw Exception('Something went wrong: ${e.toString()}');
    }
  }

  Future<List<TrendingResult>> getTrendingNow({int page = 1}) async {
    try {
      final Response response = await _dio.get(
        UrlConstants.trendingAll,
        queryParameters: {'language': 'en-US', 'page': page},
      );
      if (response.statusCode == 200) {
        final List<dynamic> results = response.data['results'];
        return results.map((e) => TrendingResult.fromJson(e)).toList();
      } else {
        throw Exception('Failed to fetch trending content');
      }
    } catch (e) {
      throw Exception('Something went wrong: ${e.toString()}');
    }
  }

  Future<List<PopularMovie>> getTop10Movies({int page = 1}) async {
    try {
      final Response response = await _dio.get(
        UrlConstants.topRatedMovies,
        queryParameters: {'language': 'en-US', 'page': page},
      );
      if (response.statusCode == 200) {
        final List<dynamic> movies = response.data['results'];
        return movies.map((e) => PopularMovie.fromJson(e)).toList();
      } else {
        throw Exception('Failed to fetch top 10 movies');
      }
    } catch (e) {
      throw Exception('Something went wrong: ${e.toString()}');
    }
  }

  Future<List<PopularMovie>> getAfricanMovies({int page = 1}) async {
    try {
      final Response response = await _dio.get(
        UrlConstants.discoverMovies,
        queryParameters: {
          'language': 'en-US',
          'page': page,
          'sort_by': 'popularity.desc',
          'with_origin_country': 'NG|GH|ZA|KE|ET|EG',
        },
      );
      if (response.statusCode == 200) {
        final List<dynamic> movies = response.data['results'];
        return movies.map((e) => PopularMovie.fromJson(e)).toList();
      } else {
        throw Exception('Failed to fetch African movies');
      }
    } catch (e) {
      throw Exception('Something went wrong: ${e.toString()}');
    }
  }

  Future<List<PopularMovie>> getNewReleases({int page = 1}) async {
    try {
      final Response response = await _dio.get(
        UrlConstants.nowPlayingMovies,
        queryParameters: {'language': 'en-US', 'page': page},
      );
      if (response.statusCode == 200) {
        final List<dynamic> movies = response.data['results'];
        return movies.map((e) => PopularMovie.fromJson(e)).toList();
      } else {
        throw Exception('Failed to fetch new releases');
      }
    } catch (e) {
      throw Exception('Something went wrong: ${e.toString()}');
    }
  }

  Future<List<TvShow>> getTvThrillersMystery({int page = 1}) async {
    try {
      final Response response = await _dio.get(
        UrlConstants.discoverTv,
        queryParameters: {
          'language': 'en-US',
          'page': page,
          'sort_by': 'popularity.desc',
          'with_genres': '9648|80',
        },
      );
      if (response.statusCode == 200) {
        final List<dynamic> shows = response.data['results'];
        return shows.map((e) => TvShow.fromJson(e)).toList();
      } else {
        throw Exception('Failed to fetch TV thrillers & mystery');
      }
    } catch (e) {
      throw Exception('Something went wrong: ${e.toString()}');
    }
  }

  Future<List<TvShow>> getUsTvShows({int page = 1}) async {
    try {
      final Response response = await _dio.get(
        UrlConstants.discoverTv,
        queryParameters: {
          'language': 'en-US',
          'page': page,
          'sort_by': 'popularity.desc',
          'with_origin_country': 'US',
        },
      );
      if (response.statusCode == 200) {
        final List<dynamic> shows = response.data['results'];
        return shows.map((e) => TvShow.fromJson(e)).toList();
      } else {
        throw Exception('Failed to fetch US TV shows');
      }
    } catch (e) {
      throw Exception('Something went wrong: ${e.toString()}');
    }
  }
}
