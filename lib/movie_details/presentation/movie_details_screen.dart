import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/app_styles.dart';
import 'package:movies/core/assets_manger.dart';
import 'package:movies/core/colors_manger.dart';
import 'package:movies/core/common_widgets/cupertino_button/custom_cupertino_button.dart';
import 'package:movies/core/common_widgets/error_widget.dart';
import 'package:movies/core/di/di.dart';
import 'package:movies/main_layout/widgets/movie_item.dart';
import 'package:movies/movie_details/widgets/cast_item.dart';
import 'package:movies/movie_details/widgets/details_container_item.dart';
import 'package:movies/movie_details/widgets/genre_item.dart';
import 'package:movies/provider/movie_details_provider.dart';
import 'package:movies/provider/movies_suggestion_provider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class MovieDetailsScreen extends StatefulWidget {
  const MovieDetailsScreen({super.key});

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  late int movieId;
  late MovieDetailsProvider movieDetailsProvider;
  late MoviesSuggestionProvider moviesSuggestionProvider;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    movieId = ModalRoute.of(context)!.settings.arguments as int;
    print(movieId);
    movieDetailsProvider = MovieDetailsProvider();
    movieDetailsProvider.getMoviesDetails(movieId);
    moviesSuggestionProvider = getIt<MoviesSuggestionProvider>();
    moviesSuggestionProvider.getMovieSuggestions(movieId);
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: movieDetailsProvider),
        ChangeNotifierProvider.value(value: moviesSuggestionProvider),
      ],
      child: Scaffold(
        // appBar: AppBar(
        //   actions: [
        //     Icon(Icons.bookmark_border)
        //   ],
        // ),
        body: Consumer<MovieDetailsProvider>(
          builder: (context, provider, child) {
            var state = provider.state;
            switch (state) {
              case MovieDetailsLoadingState():
                return Center(child: CircularProgressIndicator());
              case MovieDetailsSuccessState():
                return SingleChildScrollView(
                  child: Stack(
                    children: [
                      AspectRatio(
                        aspectRatio: 9 / 16,
                        child: Stack(
                          children: [
                            Image.network(state.movie.largeCoverImage!),
                            Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    ColorsManger.black60,
                                    ColorsManger.black71,
                                    ColorsManger.black,
                                  ],
                                  stops: const [0.4, 0.45, 1.0],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SafeArea(
                        child: Padding(
                          padding: REdgeInsets.symmetric(horizontal: 16.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: Icon(
                                      Icons.arrow_back_ios_new,
                                      color: ColorsManger.white,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.bookmark_border,
                                      color: ColorsManger.white,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  SizedBox(height: 150.h),
                                  Image.asset(AssetsManger.play),
                                  SizedBox(height: 200.h),
                                  Text(
                                    state.movie.title!,
                                    textAlign: TextAlign.center,
                                    style: AppStyles.white24bold,
                                  ),
                                  SizedBox(height: 16.h),
                                  Text(
                                    "${state.movie.year}",
                                    textAlign: TextAlign.center,
                                    style: AppStyles.grey20Bold,
                                  ),
                                  SizedBox(height: 8.h),
                                  CustomCupertinoButton(
                                    text: "Watch",
                                    onPress: () {
                                      _launchUrl(state.movie.url!);
                                    },
                                    backgroundColor: ColorsManger.red,
                                    borderColor: Colors.transparent,
                                  ),
                                  SizedBox(height: 16.h),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      DetailsContainerItem(
                                        title: "${state.movie.likeCount}",
                                        icon: Icons.favorite,
                                      ),
                                      DetailsContainerItem(
                                        title: "${state.movie.runtime}",
                                        icon: Icons.timer,
                                      ),
                                      DetailsContainerItem(
                                        title: "${state.movie.rating}",
                                        icon: Icons.star_rounded,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 16.h),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Screenshots",
                                      style: AppStyles.white24bold,
                                    ),
                                  ),
                                  SizedBox(height: 8.h),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(16.r),
                                    child: Image.network(
                                      state.movie.mediumScreenshotImage1!,
                                    ),
                                  ),
                                  SizedBox(height: 12.h),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(16.r),
                                    child: Image.network(
                                      state.movie.mediumScreenshotImage2!,
                                    ),
                                  ),
                                  SizedBox(height: 12.h),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(16.r),
                                    child: Image.network(
                                      state.movie.mediumScreenshotImage3!,
                                    ),
                                  ),
                                  SizedBox(height: 16.h),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Similar",
                                      style: AppStyles.white24bold,
                                    ),
                                  ),
                                  SizedBox(height: 8.h),
                                  Consumer<MoviesSuggestionProvider>(
                                    builder: (context, provider, child) {
                                      var state = provider.state;
                                      switch (state) {
                                        case MoviesSuggestionLoadingState():
                                          return Center(
                                            child: CircularProgressIndicator(),
                                          );
                                        case MoviesSuggestionSuccessState():
                                          return GridView.builder(
                                            gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2,
                                              crossAxisSpacing: 12,
                                              mainAxisSpacing: 16,
                                              childAspectRatio: 0.7,
                                            ),
                                            shrinkWrap: true,
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            itemCount: state.movies.length,
                                            itemBuilder: (context, index) =>
                                                MovieItem(
                                                  movie: state.movies[index],
                                                ),
                                          );
                                        case MoviesSuggestionErrorState():
                                          return ErrorStateWidget(
                                            serverError: state.serverError,
                                            exception: state.generalException,
                                          );
                                      }
                                    },
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Description",
                                      style: AppStyles.white24bold,
                                    ),
                                  ),
                                  SizedBox(height: 8.h),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      state.movie.descriptionFull!,
                                      style: AppStyles.white16medium,
                                    ),
                                  ),
                                  SizedBox(height: 8.h),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Cast",
                                      style: AppStyles.white24bold,
                                    ),
                                  ),
                                  SizedBox(height: 8.h),
                                  ListView.builder(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: state.movie.cast!.length,
                                    itemBuilder: (context, index) => CastItem(
                                      cast: state.movie.cast![index],
                                    ),
                                  ),
                                  SizedBox(height: 8.h),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Genres",
                                      style: AppStyles.white24bold,
                                    ),
                                  ),
                                  SizedBox(height: 8.h),
                                  GridView.builder(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 3,
                                          crossAxisSpacing: 8.0,
                                          mainAxisSpacing: 8.0,
                                          childAspectRatio: 2.5,
                                        ),
                                    itemCount: state.movie.genres!.length,
                                    itemBuilder: (context, index) => GenreItem(
                                      genre: state.movie.genres![index],
                                    ),
                                  ),
                                  SizedBox(height: 16.h),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              case MovieDetailsErrorState():
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

  void _launchUrl(String url) async {
    Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.inAppBrowserView);
    }
  }
}
