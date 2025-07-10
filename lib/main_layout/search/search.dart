import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/app_styles.dart';
import 'package:movies/core/assets_manger.dart';
import 'package:movies/core/colors_manger.dart';
import 'package:movies/core/common_widgets/custom_text_form_field/custom_text_form_field.dart';
import 'package:movies/core/common_widgets/error_widget.dart';
import 'package:movies/core/di/di.dart';
import 'package:movies/main_layout/widgets/movie_item.dart';
import 'package:movies/provider/movies_search_provider.dart';
import 'package:provider/provider.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  late TextEditingController searchController;
  late MoviesSearchProvider moviesSearchProvider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchController = TextEditingController();
    moviesSearchProvider = getIt<MoviesSearchProvider>();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 16.0),
      child: SafeArea(
        child: Column(
          children: [
            CustomTextFormField(
              onChanged: (value) {
                moviesSearchProvider.search(value);
              },
              controller: searchController,
              prefixIcon: Icon(Icons.search),
              hintText: "Search",
              hintStyle: AppStyles.white16medium,
              borderColor: ColorsManger.grey,
              filledColor: ColorsManger.grey,
            ),
            SizedBox(height: 20.h),
            ChangeNotifierProvider(
              create: (context) => moviesSearchProvider,
              child: Consumer<MoviesSearchProvider>(
                builder: (context, provider, child) {
                  var state = provider.state;
                  switch (state) {
                    case MoviesSearchLoadingState():
                      return Expanded(
                        child: Center(child: Image.asset(AssetsManger.empty)),
                      );
                    case MoviesSearchSuccessState():
                      return Expanded(
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 12,
                                mainAxisSpacing: 16,
                                childAspectRatio: 0.7,
                              ),
                          itemCount: state.movies.length,
                          itemBuilder: (context, index) => MovieItem(movie: state.movies[index],),
                        ),
                      );
                    case MoviesSearchErrorState():
                      return ErrorStateWidget(serverError: state.serverError,exception: state.generalException,);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
