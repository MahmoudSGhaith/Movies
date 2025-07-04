import 'package:injectable/injectable.dart';
import 'package:movies/core/result.dart';
import 'package:movies/data/data_source_contact/movies_by_year_datasource.dart';
import 'package:movies/data/models/Movies.dart';
import 'package:movies/domain/entities/movie_entity.dart';
import 'package:movies/domain/repo_contract/movies_by_year_repo.dart';


@Injectable(as: MoviesByYearRepo)
class MoviesByYearRepoImpl extends MoviesByYearRepo {
  MoviesByYearDataSource dataSource;

  @factoryMethod
  MoviesByYearRepoImpl({required this.dataSource});

  @override
  Future<Result<List<MovieEntity>>> getMoviesByYear() async {
    var result = await dataSource.getMoviesByYear();
    switch (result) {
      case Success<List<Movies>>():
        return Success(
          data: result.data
              .map(
                (movie) => MovieEntity(
                  mediumImage: movie.mediumCoverImage,
                  rating: movie.rating!,
                  largeImage: movie.largeCoverImage,
                ),
              )
              .toList(),
        );
      case ServerError<List<Movies>>():
        return ServerError(
          status: result.status,
          statusMessage: result.statusMessage,
        );
      case GeneralException<List<Movies>>():
        return GeneralException(exception: result.exception);
    }
  }
}
