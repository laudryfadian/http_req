import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http_req/models/movies.dart';

class HttpService {
  final String apiKey = "bc1b9193e73ef803f5930872715cf255";
  final String baseUrl = "https://api.themoviedb.org/3/movie/popular?api_key=";

  Future<List<Results>> getPopularMovies() async {
    final String uri = baseUrl + apiKey;
    List<Results> movies = [];
    try {
      http.Response response = await http.get(Uri.parse(uri));
      if (response.statusCode == HttpStatus.ok) {
        List result = jsonDecode(response.body)['results'];
        movies = result.map((i) => Results.fromJson(i)).toList();
      } else {
        return movies;
      }
    } catch (e) {
      print(e);
    }
    return movies;
  }
}
