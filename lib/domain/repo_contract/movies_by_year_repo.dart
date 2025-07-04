import 'package:movies/core/result.dart';
import 'package:movies/domain/entities/movie_entity.dart';

abstract class MoviesByYearRepo{
  Future<Result<List<MovieEntity>>> getMoviesByYear();
}