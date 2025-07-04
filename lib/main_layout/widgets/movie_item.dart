import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/app_styles.dart';
import 'package:movies/core/assets_manger.dart';
import 'package:movies/core/colors_manger.dart';
import 'package:movies/domain/entities/movie_entity.dart';

class MovieItem extends StatelessWidget {
  const MovieItem({super.key, this.movie});

  final MovieEntity? movie;

  @override
  Widget build(BuildContext context) {
    if (movie == null) {
      return Padding(
        padding: REdgeInsets.all(8),
        child: Container(
          child: Stack(
            alignment: Alignment.topLeft,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16.r),
                child: Image.asset(AssetsManger.onBoarding6),
              ),
              Padding(
                padding: REdgeInsets.all(8.0),
                child: Container(
                  padding: REdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: ColorsManger.black71,
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("7.7", style: AppStyles.white16mediumOpacity60),
                      SizedBox(width: 4.w),
                      Image.asset(AssetsManger.star, height: 24.h, width: 24.w),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Padding(
      padding: REdgeInsets.all(8),
      child: Container(
        child: Stack(
          alignment: Alignment.topLeft,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
              child: Image.network(
                movie!.mediumImage!,
                errorBuilder: (context, error, stackTrace) => Image.asset(AssetsManger.onBoarding6),
              ),
            ),
            Padding(
              padding: REdgeInsets.all(8.0),
              child: Container(
                padding: REdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: ColorsManger.black71,
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "${movie!.rating}",
                      style: AppStyles.white16mediumOpacity60,
                    ),
                    SizedBox(width: 4.w),
                    Image.asset(AssetsManger.star, height: 24.h, width: 24.w),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
