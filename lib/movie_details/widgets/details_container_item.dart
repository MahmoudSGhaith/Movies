import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/app_styles.dart';
import 'package:movies/core/colors_manger.dart';

class DetailsContainerItem extends StatelessWidget {
  const DetailsContainerItem({super.key, required this.title, required this.icon});

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: REdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
          color: ColorsManger.grey,
          borderRadius: BorderRadius.circular(16.r)
      ),
      child: Row(
        children: [
          Icon(icon, color: ColorsManger.yellow, size: 30,),
          SizedBox(width: 12.h,),
          Text(title, style: AppStyles.white24bold,)
        ],
      ),
    );
  }
}
