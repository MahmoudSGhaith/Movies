import 'package:injectable/injectable.dart';
import 'package:movies/core/result.dart';
import 'package:movies/domain/entities/movie_entity.dart';
import 'package:movies/movie_details/domain/repo/movie_suggestion_repo.dart';

@injectable
class MoviesSuggestionUseCase {
  final MoviesSuggestionRepo moviesSuggestionRepo;

  @factoryMethod
  MoviesSuggestionUseCase({required this.moviesSuggestionRepo});

  Future<Result<List<MovieEntity>>> invoke(int id) {
    return moviesSuggestionRepo.getMoviesSuggestions(id);
  }
}
