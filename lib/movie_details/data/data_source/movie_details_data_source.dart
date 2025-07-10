import 'package:movies/core/result.dart';
import 'package:movies/movie_details/data/models/Movie.dart';

abstract class MovieDetailsDataSource{
  Future<Result<Movie>> getMovieDetails(int id);
}