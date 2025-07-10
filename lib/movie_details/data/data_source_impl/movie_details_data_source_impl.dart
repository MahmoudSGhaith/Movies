import 'package:injectable/injectable.dart';
import 'package:movies/core/result.dart';
import 'package:movies/data/api_services.dart';
import 'package:movies/movie_details/data/data_source/movie_details_data_source.dart';
import 'package:movies/movie_details/data/models/Movie.dart';

@Injectable(as: MovieDetailsDataSource)
class MovieDetailsDataSourceImpl implements MovieDetailsDataSource{

  final ApiServices apiServices;

  @factoryMethod
  MovieDetailsDataSourceImpl({required this.apiServices});

  @override
  Future<Result<Movie>> getMovieDetails(int id) {
    return apiServices.getMovieDetails(id);
  }

}