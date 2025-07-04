import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:movies/core/result.dart';
import 'package:movies/data/models/Movie_response.dart';
import 'package:movies/data/models/Movies.dart';

@singleton
class ApiServices{

  static const String _baseUrl = "yts.mx";
  static const String movieListEndpoint = "/api/v2/list_movies.json";

  Future<Result<List<Movies>>> getMoviesSortedByYear()async {
    try {
      Uri url = Uri.https(_baseUrl,movieListEndpoint,{
        "sort_by": "year",
      });

      var response = await http.get(url);
      var json = jsonDecode(response.body);

      MovieResponse movieResponse = MovieResponse.fromJson(json);
      List<Movies>? movies = movieResponse.data!.movies;

      if(movieResponse.status == "ok"){
        return Success(data: movies!);
      }else{
        return ServerError(status: movieResponse.status!, statusMessage: movieResponse.statusMessage!);
      }
    } on Exception catch (e) {
      return GeneralException(exception: e);
    }
  }

  Future<Result<List<Movies>>> getMovies(String genre) async{
    try {
      Uri url = Uri.https(_baseUrl, movieListEndpoint,{
        "genre": genre,
      });

      var response = await http.get(url);
      var json = jsonDecode(response.body);
      MovieResponse movieResponse = MovieResponse.fromJson(json);
      List<Movies>? movies = movieResponse.data!.movies;
      if(movieResponse.status == "ok"){
        return Success(data: movies!);
      }else{
        return ServerError(status: movieResponse.status!, statusMessage: movieResponse.statusMessage!);
      }
    } on Exception catch (e) {
      return GeneralException(exception: e);
    }
  }

}