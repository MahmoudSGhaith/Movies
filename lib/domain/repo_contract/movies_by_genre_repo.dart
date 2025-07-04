import 'package:movies/core/result.dart';
import 'package:movies/domain/entities/movie_entity.dart';

abstract class MoviesByGenreRepo{
  Future<Result<List<MovieEntity>>> getMoviesByGenre(String genre);
}