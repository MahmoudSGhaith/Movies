import 'package:movies/core/result.dart';
import 'package:movies/data/models/Movies.dart';

abstract class MoviesByYearDataSource{
  Future<Result<List<Movies>>> getMoviesByYear();
}