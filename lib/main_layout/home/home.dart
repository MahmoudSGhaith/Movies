import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/app_styles.dart';
import 'package:movies/core/assets_manger.dart';
import 'package:movies/core/colors_manger.dart';
import 'package:movies/core/common_widgets/error_widget.dart';
import 'package:movies/core/constants_manager.dart';
import 'package:movies/core/di/di.dart';
import 'package:movies/domain/entities/movie_entity.dart';
import 'package:movies/main_layout/widgets/movie_item.dart';
import 'package:movies/provider/movies_by_genre_provider.dart';
import 'package:movies/provider/movies_by_year_provider.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key, required this.genreIndex});

  final int genreIndex;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late MoviesByYearProvider moviesProviderByYear;
  late MoviesByGenreProvider moviesProviderByGenre;
  late int newGenreIndex;

  List<MovieEntity> movies = [];
  int movieImageIndex = 0;

  @override
  void initState() {
    super.initState();
    newGenreIndex = widget.genreIndex;

    moviesProviderByYear = getIt<MoviesByYearProvider>();
    moviesProviderByYear.loadMoviesByYear();

    moviesProviderByGenre = getIt<MoviesByGenreProvider>();
    moviesProviderByGenre.loadMovies(
      ConstantsManager.categories[newGenreIndex].name,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: moviesProviderByYear),
        ChangeNotifierProvider.value(value: moviesProviderByGenre),
      ],
      child: SingleChildScrollView(
        child: Consumer<MoviesByYearProvider>(
          builder: (context, provider, child) {
            var state = provider.state;
            switch (state) {
              case MoviesByYearSuccessState():
                movies = state.movies;
                return Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    AspectRatio(
                      aspectRatio: 9 / 16,
                      child: Stack(
                        children: [
                          Image.network(movies[movieImageIndex].largeImage!),
                          Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  ColorsManger.black50,
                                  ColorsManger.black60,
                                  ColorsManger.black,
                                ],
                                stops: const [0.4, 0.75, 1.0],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SafeArea(
                      child: Padding(
                        padding: REdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          children: [
                            Image.asset(AssetsManger.availableNow),
                            SizedBox(height: 20.h),
                            CarouselSlider(
                              options: CarouselOptions(
                                height: 350,
                                viewportFraction: 0.6,
                                enlargeCenterPage: true,
                                onPageChanged: (index, reason) {
                                  setState(() {
                                    movieImageIndex = index;
                                  });
                                  print("index = $movieImageIndex");
                                },
                              ),
                              items: state.movies
                                  .map((movie) => MovieItem(movie: movie))
                                  .toList(),
                            ),
                            Image.asset(AssetsManger.watchNow),
                            SizedBox(height: 20.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  ConstantsManager
                                      .categories[newGenreIndex]
                                      .name,
                                  style: AppStyles.white20medium,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "See more",
                                      style: AppStyles.yellow16medium,
                                    ),
                                    SizedBox(width: 4.w),
                                    Icon(
                                      Icons.arrow_forward,
                                      color: ColorsManger.yellow,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 10.h),
                            Consumer<MoviesByGenreProvider>(
                              builder: (context, genreProvider, child) {
                                var genreState = genreProvider.state;

                                switch (genreState) {
                                  case MoviesByGenreSuccessState():
                                    return SizedBox(
                                      height: 200.h,
                                      child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: genreState.movies.length,
                                        itemBuilder: (context, index) =>
                                            MovieItem(
                                              movie: genreState.movies[index],
                                            ),
                                      ),
                                    );
                                  case MoviesByGenreLoadingState():
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  case MoviesByGenreErrorState():
                                    return ErrorStateWidget(
                                      serverError: genreState.serverError,
                                      exception: genreState.generalException,
                                    );
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );

              case MoviesByYearLoadingState():
                return const Center(child: CircularProgressIndicator());

              case MoviesByYearErrorState():
                return ErrorStateWidget(
                  serverError: state.serverError,
                  exception: state.generalException,
                );
            }
          },
        ),
      ),
    );
  }
}
