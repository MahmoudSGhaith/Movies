import 'package:movies/core/result.dart';
import 'package:movies/data/models/Movies.dart';

abstract class MoviesSearchDataSource{
  Future<Result<List<Movies>>> search(String searchKey);
}