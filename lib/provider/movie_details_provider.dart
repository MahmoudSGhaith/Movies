import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/core/result.dart';
import 'package:movies/data/api_services.dart';
import 'package:movies/movie_details/data/models/Movie.dart';
import 'package:movies/movie_details/domain/entities/movie_details_entity.dart';
import 'package:movies/movie_details/domain/usecases/movie_details_usecase.dart';

@injectable
class MovieDetailsProvider extends ChangeNotifier{

  final MovieDetailsUseCase useCase;
  @factoryMethod
  MovieDetailsProvider({required this.useCase});
  MovieDetailsState state = MovieDetailsLoadingState();

  Future<void> getMoviesDetails(int id) async{
    var result = await useCase.invoke(id);
    switch (result) {
      case Success<MovieDetailsEntity>():
        state = MovieDetailsSuccessState(movie: result.data);
        notifyListeners();
      case ServerError<MovieDetailsEntity>():
        state = MovieDetailsErrorState(serverError: result);
        notifyListeners();
      case GeneralException<MovieDetailsEntity>():
        state = MovieDetailsErrorState(generalException: result);
        notifyListeners();
    }
  }
}

sealed class MovieDetailsState{}
class MovieDetailsLoadingState extends MovieDetailsState{
  String? loadingMsg;
  MovieDetailsLoadingState({this.loadingMsg});
}
class MovieDetailsSuccessState extends MovieDetailsState{
  MovieDetailsEntity movie;
  MovieDetailsSuccessState({required this.movie});
}
class MovieDetailsErrorState extends MovieDetailsState{
  ServerError? serverError;
  GeneralException? generalException;
  MovieDetailsErrorState({this.serverError, this.generalException});
}

