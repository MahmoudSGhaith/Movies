import 'package:movies/core/result.dart';
import 'package:movies/domain/entities/movie_entity.dart';

abstract class MoviesSuggestionRepo{
  Future<Result<List<MovieEntity>>> getMoviesSuggestions(int id);
}