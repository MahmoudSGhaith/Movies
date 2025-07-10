import 'package:injectable/injectable.dart';
import 'package:movies/core/result.dart';
import 'package:movies/movie_details/data/data_source/movie_details_data_source.dart';
import 'package:movies/movie_details/data/models/Movie.dart';
import 'package:movies/movie_details/domain/entities/movie_details_entity.dart';
import 'package:movies/movie_details/domain/repo/movie_details_repo.dart';

@Injectable(as: MovieDetailsRepo)
class MovieDetailsRepoImpl implements MovieDetailsRepo {
  final MovieDetailsDataSource dataSource;

  @factoryMethod
  const MovieDetailsRepoImpl({required this.dataSource});

  @override
  Future<Result<MovieDetailsEntity>> getMoviesDetails(int id) async {
    var result = await dataSource.getMovieDetails(id);
    switch (result) {
      case Success<Movie>():
        return Success(
          data: MovieDetailsEntity(
            largeCoverImage: result.data.largeCoverImage!,
            year: result.data.year!,
            url: result.data.url!,
            likeCount: result.data.likeCount!,
            runtime: result.data.runtime!,
            rating: result.data.rating!,
            mediumScreenshotImage1: result.data.mediumScreenshotImage1!,
            mediumScreenshotImage2: result.data.mediumScreenshotImage2!,
            mediumScreenshotImage3: result.data.mediumScreenshotImage3!,
            title: result.data.title!,
            genres: result.data.genres!,
            descriptionFull: result.data.descriptionFull!,
            cast: result.data.cast!,
          ),
        );
      case ServerError<Movie>():
        return ServerError(
          status: result.status,
          statusMessage: result.statusMessage,
        );
      case GeneralException<Movie>():
        return GeneralException(exception: result.exception);
    }
  }
}
