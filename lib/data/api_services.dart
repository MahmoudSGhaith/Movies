import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:movies/core/result.dart';
import 'package:movies/data/models/Movie_response.dart';
import 'package:movies/data/models/Movies.dart';
import 'package:movies/movie_details/data/models/Movie.dart';
import 'package:movies/movie_details/data/models/Movie_details_response.dart';

@singleton
class ApiServices {
  static const String _baseUrl = "yts.mx";
  static const String movieListEndpoint = "/api/v2/list_movies.json";
  static const String movieDetailsEndpoint = "/api/v2/movie_details.json";
  static const String movieSuggestionsEndpoint =
      "/api/v2/movie_suggestions.json";

  Future<Result<List<Movies>>> getMoviesSortedByYear() async {
    try {
      Uri url = Uri.https(_baseUrl, movieListEndpoint, {"sort_by": "year"});

      var response = await http.get(url);
      var json = jsonDecode(response.body);

      MoviesResponse movieResponse = MoviesResponse.fromJson(json);
      if (movieResponse.status == "ok") {
        List<Movies>? movies = movieResponse.data!.movies;
        return Success(data: movies!);
      } else {
        return ServerError(
          status: movieResponse.status!,
          statusMessage: movieResponse.statusMessage!,
        );
      }
    } on Exception catch (e) {
      return GeneralException(exception: e);
    }
  }

  Future<Result<List<Movies>>> getMovies(String genre) async {
    try {
      Uri url = Uri.https(_baseUrl, movieListEndpoint, {"genre": genre});

      var response = await http.get(url);
      var json = jsonDecode(response.body);
      MoviesResponse movieResponse = MoviesResponse.fromJson(json);
      if (movieResponse.status == "ok") {
        List<Movies>? movies = movieResponse.data!.movies;
        return Success(data: movies!);
      } else {
        return ServerError(
          status: movieResponse.status!,
          statusMessage: movieResponse.statusMessage!,
        );
      }
    } on Exception catch (e) {
      return GeneralException(exception: e);
    }
  }

  static Future<Result<Movie>> getMovieDetails(int id) async {
    try {
      Uri url = Uri.https(_baseUrl, movieDetailsEndpoint, {
        "movie_id": id.toString(),
        "with_cast": "true",
        "with_images": "true",
      });

      var response = await http.get(url);
      var json = jsonDecode(response.body);
      MovieDetailsResponse movieDetailsResponse = MovieDetailsResponse.fromJson(
        json,
      );
      if (movieDetailsResponse.status == "ok") {
        return Success(data: movieDetailsResponse.data!.movie!);
      } else {
        return ServerError(
          status: movieDetailsResponse.status!,
          statusMessage: movieDetailsResponse.statusMessage!,
        );
      }
    } on Exception catch (e) {
      return GeneralException(exception: e);
    }
  }

  Future<Result<List<Movies>>> getMovieSuggestions(int id) async {
    try {
      Uri url = Uri.https(_baseUrl, movieSuggestionsEndpoint, {
        "movie_id": id.toString(),
      });
      var response = await http.get(url);
      var json = jsonDecode(response.body);
      MoviesResponse moviesResponse = MoviesResponse.fromJson(json);
      if (moviesResponse.status == "ok") {
        List<Movies>? movies = moviesResponse.data!.movies;
        return Success(data: movies!);
      } else {
        return ServerError(
          status: moviesResponse.status!,
          statusMessage: moviesResponse.statusMessage!,
        );
      }
    } on Exception catch (e) {
      return GeneralException(exception: e);
    }
  }
}
