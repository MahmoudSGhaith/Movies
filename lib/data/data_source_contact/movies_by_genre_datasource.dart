import 'package:movies/core/result.dart';
import 'package:movies/data/models/Movies.dart';

abstract class MoviesByGenreDataSource{
  Future<Result<List<Movies>>> getMovieByGenre(String genre);
}