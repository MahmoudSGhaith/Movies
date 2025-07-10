import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/app_styles.dart';
import 'package:movies/core/colors_manger.dart';

class GenreItem extends StatelessWidget {
  const GenreItem({super.key, required this.genre});

  final String genre;

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
          color: ColorsManger.grey,
          borderRadius: BorderRadius.circular(16.r)
      ),
      padding: REdgeInsets.all(14),
      child: Text(genre, textAlign: TextAlign.center, style: AppStyles.white16medium,),
    );
  }
}
