// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../data/api_services.dart' as _i123;
import '../../data/data_source_contact/movies_by_genre_datasource.dart'
    as _i384;
import '../../data/data_source_contact/movies_by_year_datasource.dart' as _i361;
import '../../data/data_source_impl/movies_by_genre_datasource_impl.dart'
    as _i166;
import '../../data/data_source_impl/movies_by_year_datasource_impl.dart'
    as _i77;
import '../../data/repo_impl/movies_by_genre_repo_impl.dart' as _i694;
import '../../data/repo_impl/movies_by_year_repo_impl.dart' as _i188;
import '../../domain/repo_contract/movies_by_genre_repo.dart' as _i985;
import '../../domain/repo_contract/movies_by_year_repo.dart' as _i244;
import '../../domain/use_cases/movies_by_genre_usecase.dart' as _i923;
import '../../domain/use_cases/movies_by_year_usecase.dart' as _i169;
import '../../movie_details/data/data_source/movies_suggestion_data_source.dart'
    as _i719;
import '../../movie_details/data/data_source_impl/movies_suggestion_data_source_impl.dart'
    as _i316;
import '../../movie_details/data/repo_impl/movies_suggestions_repo_impl.dart'
    as _i591;
import '../../movie_details/domain/repo/movie_suggestion_repo.dart' as _i974;
import '../../movie_details/domain/usecases/movies_suggestions_usecase.dart'
    as _i118;
import '../../provider/movies_by_genre_provider.dart' as _i15;
import '../../provider/movies_by_year_provider.dart' as _i857;
import '../../provider/movies_suggestion_provider.dart' as _i2;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.singleton<_i123.ApiServices>(() => _i123.ApiServices());
    gh.factory<_i384.MoviesByGenreDataSource>(
      () => _i166.MoviesByGenreDataSourceImpl(
        apiServices: gh<_i123.ApiServices>(),
      ),
    );
    gh.factory<_i719.MoviesSuggestionDataSource>(
      () => _i316.MoviesSuggestionDataSourceImpl(
        apiServices: gh<_i123.ApiServices>(),
      ),
    );
    gh.factory<_i361.MoviesByYearDataSource>(
      () =>
          _i77.MoviesByYearDataSourceImpl(apiServices: gh<_i123.ApiServices>()),
    );
    gh.factory<_i244.MoviesByYearRepo>(
      () => _i188.MoviesByYearRepoImpl(
        dataSource: gh<_i361.MoviesByYearDataSource>(),
      ),
    );
    gh.factory<_i169.MoviesByYearUseCase>(
      () => _i169.MoviesByYearUseCase(repo: gh<_i244.MoviesByYearRepo>()),
    );
    gh.factory<_i974.MoviesSuggestionRepo>(
      () => _i591.MoviesSuggestionsRepoImpl(
        moviesSuggestionDataSource: gh<_i719.MoviesSuggestionDataSource>(),
      ),
    );
    gh.factory<_i985.MoviesByGenreRepo>(
      () => _i694.MoviesByGenreRepoImpl(
        dataSource: gh<_i384.MoviesByGenreDataSource>(),
      ),
    );
    gh.factory<_i923.MoviesByGenreUseCase>(
      () => _i923.MoviesByGenreUseCase(repo: gh<_i985.MoviesByGenreRepo>()),
    );
    gh.factory<_i857.MoviesByYearProvider>(
      () =>
          _i857.MoviesByYearProvider(useCase: gh<_i169.MoviesByYearUseCase>()),
    );
    gh.factory<_i118.MoviesSuggestionUseCase>(
      () => _i118.MoviesSuggestionUseCase(
        moviesSuggestionRepo: gh<_i974.MoviesSuggestionRepo>(),
      ),
    );
    gh.factory<_i2.MoviesSuggestionProvider>(
      () => _i2.MoviesSuggestionProvider(
        useCase: gh<_i118.MoviesSuggestionUseCase>(),
      ),
    );
    gh.factory<_i15.MoviesByGenreProvider>(
      () =>
          _i15.MoviesByGenreProvider(useCase: gh<_i923.MoviesByGenreUseCase>()),
    );
    return this;
  }
}
