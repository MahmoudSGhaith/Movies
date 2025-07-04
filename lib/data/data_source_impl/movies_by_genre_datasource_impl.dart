import 'package:injectable/injectable.dart';
import 'package:movies/core/result.dart';
import 'package:movies/data/api_services.dart';
import 'package:movies/data/data_source_contact/movies_by_genre_datasource.dart';
import 'package:movies/data/models/Movies.dart';

@Injectable(as: MoviesByGenreDataSource)
class MoviesByGenreDataSourceImpl extends MoviesByGenreDataSource {
  ApiServices apiServices;

  @factoryMethod
  MoviesByGenreDataSourceImpl({required this.apiServices});

  @override
  Future<Result<List<Movies>>> getMovieByGenre(String genre) {
    return apiServices.getMovies(genre);
  }
}
