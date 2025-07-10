import 'package:injectable/injectable.dart';
import 'package:movies/core/result.dart';
import 'package:movies/data/models/Movies.dart';

import 'package:movies/domain/entities/movie_entity.dart';
import 'package:movies/movie_details/data/data_source/movies_suggestion_data_source.dart';

import '../../domain/repo/movie_suggestion_repo.dart';

@Injectable(as: MoviesSuggestionRepo)
class MoviesSuggestionsRepoImpl implements MoviesSuggestionRepo {
  final MoviesSuggestionDataSource moviesSuggestionDataSource;

  @factoryMethod
  MoviesSuggestionsRepoImpl({required this.moviesSuggestionDataSource});

  @override
  Future<Result<List<MovieEntity>>> getMoviesSuggestions(int id) async {
    var result = await moviesSuggestionDataSource.getMoviesSuggestion(id);
    switch (result) {
      case Success<List<Movies>>():
        return Success(
          data: result.data
              .map(
                (movie) => MovieEntity(
                  id: movie.id!,
                  rating: movie.rating!,
                  mediumImage: movie.mediumCoverImage,
                  largeImage: movie.largeCoverImage,
                ),
              )
              .toList(),
        );
      case ServerError<List<Movies>>():
        return ServerError(status: result.status, statusMessage: result.statusMessage);
      case GeneralException<List<Movies>>():
        return GeneralException(exception: result.exception);
    }
  }
}
