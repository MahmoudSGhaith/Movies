import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/app_styles.dart';
import 'package:movies/core/colors_manger.dart';
import 'package:movies/movie_details/data/models/Cast.dart';

class CastItem extends StatelessWidget {
  const CastItem({super.key, required this.cast});

  final Cast cast;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: ColorsManger.grey,
          borderRadius: BorderRadius.circular(16.r),
        ),
        padding: REdgeInsets.all(16),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
              child: Image.network(
                cast.urlSmallImage ?? "",
                errorBuilder: (context, error, stackTrace) {
                  return Icon(Icons.person,size: 60,);
                },
              ),
            ),
            SizedBox(width: 8.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Name: ${cast.name}", style: AppStyles.white20medium),
                  SizedBox(height: 4.h),
                  Text(
                    "Character: ${cast.characterName}",
                    style: AppStyles.white20medium,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
