import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/core/result.dart';
import 'package:movies/domain/entities/movie_entity.dart';
import 'package:movies/domain/use_cases/movies_by_genre_usecase.dart';

@injectable
class MoviesByGenreProvider extends ChangeNotifier{
  MoviesByGenreUseCase useCase;

  @factoryMethod
  MoviesByGenreProvider({required this.useCase});

  MoviesByGenreState state = MoviesByGenreLoadingState();

  Future<void> loadMovies(String genre) async{
    var result = await useCase.invoke(genre);
    switch(result){
      case Success<List<MovieEntity>>():
        state = MoviesByGenreSuccessState(movies: result.data);
        notifyListeners();
      case ServerError<List<MovieEntity>>():
        state = MoviesByGenreErrorState(serverError: result);
        notifyListeners();
      case GeneralException<List<MovieEntity>>():
        state = MoviesByGenreErrorState(generalException: result);
        notifyListeners();
    }
  }
}

sealed class MoviesByGenreState{}
class MoviesByGenreSuccessState extends MoviesByGenreState{
  List<MovieEntity> movies;
  MoviesByGenreSuccessState({required this.movies});
}
class MoviesByGenreLoadingState extends MoviesByGenreState{
  String? loadingMsg;

  MoviesByGenreLoadingState({this.loadingMsg});
}
class MoviesByGenreErrorState extends MoviesByGenreState{
  ServerError? serverError;
  GeneralException? generalException;
  MoviesByGenreErrorState({this.serverError, this.generalException});
}