import 'package:injectable/injectable.dart';
import 'package:movies/core/result.dart';
import 'package:movies/domain/entities/movie_entity.dart';
import 'package:movies/domain/repo_contract/movies_by_year_repo.dart';

@injectable
class MoviesByYearUseCase{
  MoviesByYearRepo repo;
  MoviesByYearUseCase({required this.repo});

  Future<Result<List<MovieEntity>>> invoke(){
    return repo.getMoviesByYear();
  }
}