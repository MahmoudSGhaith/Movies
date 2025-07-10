
import 'package:injectable/injectable.dart';
import 'package:movies/core/result.dart';
import 'package:movies/domain/entities/movie_entity.dart';
import 'package:movies/domain/repo_contract/movies_search_repo.dart';

@injectable
class MovieSearchUseCase{

  MovieSearchRepo repo;
  @factoryMethod
  MovieSearchUseCase({required this.repo});

  Future<Result<List<MovieEntity>>> invoke(String searchKey){
    return repo.search(searchKey);
  }
}