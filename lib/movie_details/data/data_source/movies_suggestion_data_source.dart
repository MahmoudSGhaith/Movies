

import 'package:movies/core/result.dart';
import 'package:movies/data/models/Movies.dart';

abstract class MoviesSuggestionDataSource {
  Future<Result<List<Movies>>> getMoviesSuggestion(int id);
}