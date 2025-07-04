import 'package:injectable/injectable.dart';
import 'package:movies/core/result.dart';
import 'package:movies/data/api_services.dart';
import 'package:movies/data/data_source_contact/movies_by_year_datasource.dart';
import 'package:movies/data/models/Movies.dart';

@Injectable(as: MoviesByYearDataSource)
class MoviesByYearDataSourceImpl extends MoviesByYearDataSource{
  ApiServices apiServices;
  @factoryMethod
  MoviesByYearDataSourceImpl({required this.apiServices});

  Future<Result<List<Movies>>> getMoviesByYear(){
    return apiServices.getMoviesSortedByYear();
  }

}