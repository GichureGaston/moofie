// import 'package:moofie/data/models/movie_card_model.dart';
//
// class MovieHttpsClient {
//   String movies = "";
//   Future<void> _getTrendingMovies() async {
//     final url = Uri.parse(Constants.trendingMovie);
//     final response = await http.get(url);
//     if (response.statusCode == 200) {
//       final data = json.decode(response.body);
//       setState(() {
//         trendingMovies = data.values.toList()[1];
//       });
//     } else {
//       throw Exception('Failed to load trending movies.');
//     }
//   }
// }

import 'dart:convert';
import 'dart:developer';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:moofie/api/constants.dart';

import '../data/models/movie_card_model.dart';
import '../env.dart';

class MovieService {
  static Future<List<Movie>> fetchPopularMovies() async {
    try {
      final response = await http.get(
        Uri.parse(
          '${ApiPaths.baseUrl}/lists?session_id=b0a32586d1a5c5f2a4d59f3fecefd744',
        ),
        headers: {
          "accept": "application/json",
          "Authorization": "Bearer ${Env.bearer}"
        },
      );

      final data = json.decode(jsonEncode(response.body));
      final List<dynamic> results = data['results'];
      return results.map((json) => Movie.fromJson(json)).toList();
    } catch (e) {
      log("######## ERROR ${e.toString()}");
      throw Exception('Failed to fetch movies');
    }
  }

  Future<List<Movie>> getTrendingMovies() async {
    final bearer = dotenv.env['BEARER'];
    final url = Uri.parse(ApiPaths.baseUrl + ApiPaths.trendingMovie);
    final response = await http.get(url, headers: {
      "accept": "application/json",
      "Authorization": "Bearer ${Env.bearer}"
    });

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<dynamic> results = data['results'];
      return results.map((json) => Movie.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load Trending Movies ! :(');
    }
  }
}
