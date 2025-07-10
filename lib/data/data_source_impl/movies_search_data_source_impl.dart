import 'package:injectable/injectable.dart';
import 'package:movies/core/result.dart';
import 'package:movies/data/api_services.dart';
import 'package:movies/data/data_source_contact/movies_search_data_source.dart';
import 'package:movies/data/models/Movies.dart';


@Injectable(as: MoviesSearchDataSource)
class MoviesSearchDataSourceImpl implements MoviesSearchDataSource{

  ApiServices apiServices;
  @factoryMethod
  MoviesSearchDataSourceImpl({required this.apiServices});

  @override
  Future<Result<List<Movies>>> search(String searchKey) {
    return apiServices.search(searchKey);
  }

}