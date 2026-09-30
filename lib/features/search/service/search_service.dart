import 'package:dio/dio.dart';
import 'package:movie_discovery/core/constants/url_constants.dart';
import 'package:movie_discovery/core/network/dio_interceptor.dart';
import 'package:movie_discovery/features/home/model/trending_model.dart';

class SearchService {
  SearchService._();
  static final SearchService instance = SearchService._();

  final Dio _dio = DioClient.instance.dio;

  Future<List<TrendingResult>> searchMulti(String query,) async {
    try {
      final Response response = await _dio.get(
        UrlConstants.searchMulti,
        queryParameters: {
          'language': 'en-US',
          'query': query,
          'page': 1,
          'include_adult': false,
        },
      );
      if (response.statusCode == 200) {
        final List<dynamic> results = response.data['results'];
        return results.map((e) => TrendingResult.fromJson(e)).toList();
      } else {
        throw Exception('Failed to search');
      }
    } catch (e) {
      throw Exception('Something went wrong: ${e.toString()}');
    }
  }
}