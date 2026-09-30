import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConstants {
  static String get apiKey => dotenv.env['TMDB_API_KEY'] ?? '';
}