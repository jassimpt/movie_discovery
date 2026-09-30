import 'package:dio/dio.dart';
import 'package:movie_discovery/core/constants/url_constants.dart';
import 'package:movie_discovery/core/network/dio_interceptor.dart';
import 'package:movie_discovery/features/home/model/popular_model.dart';

class ComingSoonService {
  ComingSoonService._();
  static final ComingSoonService instance = ComingSoonService._();

  final Dio _dio = DioClient.instance.dio;

  Future<List<PopularMovie>> getUpcomingMovies() async {
    try {
      final Response response = await _dio.get(
        UrlConstants.upcomingMovies,
        queryParameters: {'language': 'en-US', 'page': 1},
      );
      if (response.statusCode == 200) {
        final List<dynamic> results = response.data['results'];
        return results.map((e) => PopularMovie.fromJson(e)).toList();
      } else {
        throw Exception('Failed to fetch upcoming movies');
      }
    } catch (e) {
      throw Exception('Something went wrong: ${e.toString()}');
    }
  }
}