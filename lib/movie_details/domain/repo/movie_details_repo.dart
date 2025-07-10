import 'package:movies/core/result.dart';
import 'package:movies/movie_details/domain/entities/movie_details_entity.dart';

abstract class MovieDetailsRepo{
  Future<Result<MovieDetailsEntity>> getMoviesDetails(int id);
}