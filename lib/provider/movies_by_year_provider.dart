import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/core/result.dart';
import 'package:movies/data/api_services.dart';
import 'package:movies/data/models/Movies.dart';
import 'package:movies/domain/entities/movie_entity.dart';
import 'package:movies/domain/use_cases/movies_by_year_usecase.dart';

@injectable
class MoviesByYearProvider extends ChangeNotifier{

  MoviesByYearUseCase useCase;
  @factoryMethod
  MoviesByYearProvider({required this.useCase});

  MoviesByYearState state = MoviesByYearLoadingState();

  Future<void> loadMoviesByYear() async{
    var result = await useCase.invoke();
    switch (result) {
      case Success<List<MovieEntity>>():
        state = MoviesByYearSuccessState(movies: result.data);
        notifyListeners();
      case ServerError<List<MovieEntity>>():
        state = MoviesByYearErrorState(serverError: result);
        notifyListeners();
      case GeneralException<List<MovieEntity>>():
        state = MoviesByYearErrorState(generalException: result);
        notifyListeners();
    }
  }

}

sealed class MoviesByYearState{}
class MoviesByYearSuccessState extends MoviesByYearState{
  List<MovieEntity> movies;
  MoviesByYearSuccessState({required this.movies});
}
class MoviesByYearErrorState extends MoviesByYearState{
  ServerError? serverError;
  GeneralException? generalException;
  MoviesByYearErrorState({this.serverError, this.generalException});
}
class MoviesByYearLoadingState extends MoviesByYearState{
  String? loadingMsg;
  MoviesByYearLoadingState({this.loadingMsg});
}