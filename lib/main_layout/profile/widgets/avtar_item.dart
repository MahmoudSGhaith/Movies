import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/colors_manger.dart';

class AvtarItem extends StatelessWidget {
  const AvtarItem({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: REdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: ColorsManger.yellow, width: 1),
      ),
      child: Image.asset(image),
    );
  }
}
