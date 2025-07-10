import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/core/result.dart';
import 'package:movies/domain/entities/movie_entity.dart';
import 'package:movies/domain/use_cases/movie_search_usecase.dart';

@injectable
class MoviesSearchProvider extends ChangeNotifier{
  MoviesSearchState state = MoviesSearchLoadingState();

  final MovieSearchUseCase useCase;
  @factoryMethod
  MoviesSearchProvider({required this.useCase});

  Future<void> search(String searchKey) async{
    if(searchKey.isEmpty){
      notifyListeners();
      return;
    }
    var result = await useCase.invoke(searchKey);
    switch (result) {
      case Success<List<MovieEntity>>():
        state = MoviesSearchSuccessState(movies: result.data);
        notifyListeners();
      case ServerError<List<MovieEntity>>():
        state = MoviesSearchErrorState(serverError: result);
        notifyListeners();
      case GeneralException<List<MovieEntity>>():
        state = MoviesSearchErrorState(generalException: result);
        notifyListeners();
    }
  }
}

sealed class MoviesSearchState{}
class MoviesSearchLoadingState extends MoviesSearchState{
  String? loadingMsg;
  MoviesSearchLoadingState({this.loadingMsg});
}
class MoviesSearchSuccessState extends MoviesSearchState{
  List<MovieEntity> movies;
  MoviesSearchSuccessState({required this.movies});
}
class MoviesSearchErrorState extends MoviesSearchState{
  ServerError? serverError;
  GeneralException? generalException;

  MoviesSearchErrorState({this.serverError, this.generalException});
}