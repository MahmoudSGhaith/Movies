import 'package:injectable/injectable.dart';
import 'package:movies/core/result.dart';
import 'package:movies/domain/entities/movie_entity.dart';
import 'package:movies/domain/repo_contract/movies_by_genre_repo.dart';

@injectable
class MoviesByGenreUseCase{
  MoviesByGenreRepo repo;
  MoviesByGenreUseCase({required this.repo});

  Future<Result<List<MovieEntity>>> invoke(String genre){
    return repo.getMoviesByGenre(genre);
  }
}