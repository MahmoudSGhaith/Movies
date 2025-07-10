import 'package:injectable/injectable.dart';
import 'package:movies/core/result.dart';
import 'package:movies/data/data_source_contact/movies_search_data_source.dart';
import 'package:movies/data/models/Movies.dart';
import 'package:movies/domain/entities/movie_entity.dart';
import 'package:movies/domain/repo_contract/movies_search_repo.dart';

@Injectable(as: MovieSearchRepo)
class MovieSearchRepoImpl implements MovieSearchRepo {
  MoviesSearchDataSource dataSource;

  @factoryMethod
  MovieSearchRepoImpl({required this.dataSource});

  @override
  Future<Result<List<MovieEntity>>> search(String searchKey) async {
    var result = await dataSource.search(searchKey);
    switch (result) {
      case Success<List<Movies>>():
        return Success(
          data: result.data
              .map(
                (movie) => MovieEntity(
                  id: movie.id!,
                  mediumImage: movie.mediumCoverImage,
                  largeImage: movie.largeCoverImage,
                  rating: movie.rating!,
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
