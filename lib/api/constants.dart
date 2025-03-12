import 'package:moofie/env.dart';

class ApiPaths {
  static String apiKey = Env.api_key;
  static String imageBaseUrl = '';
  static String videoBaseUrl = '';
  static String baseUrl =
      'https://api.themoviedb.org/3/account/${Env.account_id}';
  static String trendingMovie = '';
  static String mostPopular = '/lists';
  static String nowPlaying = '';
  static String comingSoon = '';
  static String topRated = '';
  static String movieCredits = '';
  static String similarMovies = '';
  static String movieReviews = '';
}
