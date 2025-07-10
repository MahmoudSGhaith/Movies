import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/core/result.dart';
import 'package:movies/domain/entities/movie_entity.dart';
import 'package:movies/movie_details/domain/usecases/movies_suggestions_usecase.dart';

@injectable
class MoviesSuggestionProvider extends ChangeNotifier {

  MoviesSuggestionUseCase useCase;
  @factoryMethod
  MoviesSuggestionProvider({required this.useCase});

  MoviesSuggestionState state = MoviesSuggestionLoadingState();

  Future<void> getMovieSuggestions(int id) async {
    var result = await useCase.invoke(id);
    switch (result) {
      case Success<List<MovieEntity>>():
        state = MoviesSuggestionSuccessState(movies: result.data);
        notifyListeners();
      case ServerError<List<MovieEntity>>():
        state = MoviesSuggestionErrorState(serverError: result);
        notifyListeners();
      case GeneralException<List<MovieEntity>>():
        state = MoviesSuggestionErrorState(generalException: result);
        notifyListeners();
    }
  }
}

sealed class MoviesSuggestionState {}

class MoviesSuggestionLoadingState extends MoviesSuggestionState {
  String? loadingMsg;

  MoviesSuggestionLoadingState({this.loadingMsg});
}

class MoviesSuggestionSuccessState extends MoviesSuggestionState {
  List<MovieEntity> movies;

  MoviesSuggestionSuccessState({required this.movies});
}

class MoviesSuggestionErrorState extends MoviesSuggestionState {
  ServerError? serverError;
  GeneralException? generalException;

  MoviesSuggestionErrorState({this.serverError, this.generalException});
}
