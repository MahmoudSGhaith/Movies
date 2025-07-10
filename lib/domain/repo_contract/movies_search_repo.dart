import 'package:movies/core/result.dart';
import 'package:movies/domain/entities/movie_entity.dart';

abstract class MovieSearchRepo{
  Future<Result<List<MovieEntity>>> search(String searchKey);
}