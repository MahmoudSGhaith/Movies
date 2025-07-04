import 'package:injectable/injectable.dart';
import 'package:movies/core/result.dart';
import 'package:movies/data/data_source_contact/movies_by_genre_datasource.dart';
import 'package:movies/data/models/Movies.dart';
import 'package:movies/domain/entities/movie_entity.dart';
import 'package:movies/domain/repo_contract/movies_by_genre_repo.dart';

@Injectable(as: MoviesByGenreRepo)
class MoviesByGenreRepoImpl extends MoviesByGenreRepo {
  MoviesByGenreDataSource dataSource;

  @factoryMethod
  MoviesByGenreRepoImpl({required this.dataSource});

  @override
  Future<Result<List<MovieEntity>>> getMoviesByGenre(String genre) async {
    var result = await dataSource.getMovieByGenre(genre);
    switch (result) {
      case Success<List<Movies>>():
        return Success(
          data: result.data
              .map(
                (movie) => MovieEntity(
                  mediumImage: movie.mediumCoverImage,
                  rating: movie.rating!,
                  largeImage: movie.largeCoverImage
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
