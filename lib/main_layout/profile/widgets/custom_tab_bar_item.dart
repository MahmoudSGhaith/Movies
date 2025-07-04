import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/app_styles.dart';

class CustomTabBarProfileItem extends StatelessWidget {
  const CustomTabBarProfileItem({
    super.key,
    required this.title,
    required this.image,
  });

  final String title;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(image, width: 60.w, height: 60.h,),
        SizedBox(height: 6.h),
        Text(title, style: AppStyles.white20medium),
      ],
    );
  }
}
