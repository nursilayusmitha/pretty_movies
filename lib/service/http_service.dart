import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../models/movie.dart';

class HttpService {
  final String apiKey = 'bd5d98c0c8e4dbaf3269d7e0e57863ad';
  final String baseUrl = 'https://api.themoviedb.org/3/movie/';

  Future<List<Movie>> getPopularMovies() async {
    final String uri = '${baseUrl}popular?api_key=$apiKey';

    http.Response result = await http.get(Uri.parse(uri));
    if (result.statusCode == HttpStatus.ok) {
      final jsonResponse = json.decode(result.body);
      final moviesMap = jsonResponse['results'];
      List<Movie> movies =
          moviesMap.map<Movie>((i) => Movie.fromJson(i)).toList();
      return movies;
    } else {
      throw Exception('Failed to load movies');
    }
  }

  Future<List<Movie>> getTopRatedMovies() async {
    final String uri = '${baseUrl}top_rated?api_key=$apiKey';

    http.Response result = await http.get(Uri.parse(uri));
    if (result.statusCode == HttpStatus.ok) {
      final jsonResponse = json.decode(result.body);
      final moviesMap = jsonResponse['results'];
      List<Movie> movies =
          moviesMap.map<Movie>((i) => Movie.fromJson(i)).toList();
      return movies;
    } else {
      throw Exception('Failed to load movies');
    }
  }

  Future<List<Movie>> getUpcomingMovies() async {
    final String uri = '${baseUrl}upcoming?api_key=$apiKey';

    http.Response result = await http.get(Uri.parse(uri));
    if (result.statusCode == HttpStatus.ok) {
      final jsonResponse = json.decode(result.body);
      final moviesMap = jsonResponse['results'];
      List<Movie> movies =
          moviesMap.map<Movie>((i) => Movie.fromJson(i)).toList();
      return movies;
    } else {
      throw Exception('Failed to load movies');
    }
  }
}
