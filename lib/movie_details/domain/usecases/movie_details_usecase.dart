import 'package:injectable/injectable.dart';
import 'package:movies/core/result.dart';
import 'package:movies/movie_details/domain/entities/movie_details_entity.dart';
import 'package:movies/movie_details/domain/repo/movie_details_repo.dart';

@injectable
class MovieDetailsUseCase{
  final MovieDetailsRepo repo;

  @factoryMethod
  const MovieDetailsUseCase({required this.repo});

  Future<Result<MovieDetailsEntity>> invoke(int id){
    return repo.getMoviesDetails(id);
  }
}