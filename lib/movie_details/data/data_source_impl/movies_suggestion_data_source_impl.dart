import 'package:injectable/injectable.dart';
import 'package:movies/core/result.dart';
import 'package:movies/data/api_services.dart';

import 'package:movies/data/models/Movies.dart';

import '../data_source/movies_suggestion_data_source.dart';

@Injectable(as: MoviesSuggestionDataSource)
class MoviesSuggestionDataSourceImpl implements MoviesSuggestionDataSource{

  @factoryMethod
  MoviesSuggestionDataSourceImpl({required this.apiServices});

  final ApiServices apiServices;

  @override
  Future<Result<List<Movies>>> getMoviesSuggestion(int id) {
    return apiServices.getMovieSuggestions(id);
  }

}