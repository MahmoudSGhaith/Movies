// import 'package:injectable/injectable.dart';
// import 'package:movies/core/result.dart';
// import 'package:movies/movie_details/data/data_source/movie_details_data_source.dart';
// import 'package:movies/movie_details/data/models/Movie.dart';
// import 'package:movies/movie_details/domain/entities/movie_details_entity.dart';
// import 'package:movies/movie_details/domain/repo/movie_details_repo.dart';
//
// @Injectable(as: MovieDetailsRepo)
// class MovieDetailsRepoImpl implements MovieDetailsRepo {
//   final MovieDetailsDataSource dataSource;
//
//   @factoryMethod
//   const MovieDetailsRepoImpl({required this.dataSource});
//
//   @override
//   Future<Result<MovieDetailsEntity>> getMoviesDetails(int id) async {
//     var result = await dataSource.getMovieDetails(id);
//     switch (result) {
//       case Success<Movie>():
//         return Success(data: result.data as MovieDetailsEntity);
//       case ServerError<Movie>():
//         return ServerError(
//           status: result.status,
//           statusMessage: result.statusMessage,
//         );
//       case GeneralException<Movie>():
//         return GeneralException(exception: result.exception);
//     }
//   }
// }
